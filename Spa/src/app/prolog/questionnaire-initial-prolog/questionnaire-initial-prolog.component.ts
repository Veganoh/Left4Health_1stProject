import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { QuestionnaireInitialService } from '../../services/questionnaireinitial.service';
import { Question } from '../../domain/question';

@Component({
  selector: 'app-questionnaire-initial-prolog',
  templateUrl: './questionnaire-initial-prolog.component.html',
  styleUrls: ['./questionnaire-initial-prolog.component.scss'],
  providers: [QuestionnaireInitialService]
})

export class QuestionnaireInitialPrologComponent {
  questions: Question[] = [];

  showWarning: boolean = false;
  canProceed: boolean = false;
  conclusion : string;

  constructor(
    private router: Router,
    private service : QuestionnaireInitialService
    ) {
      this.conclusion = "Por favor preencha o questionário na sua totalidade";
    }

    ngOnInit(): void {
      this.obtainQuestions();
    }

    obtainQuestions(): void {
      this.service.obtainInitialQuestionsProlog().subscribe((response: string) => {
        const inputString = response;
        this.questions = createQuestionsFromString(inputString);
      });
    }

    async obtainAnswer(): Promise<void> {
      this.canProceed = false;
      const answer = createStringFromAnswers(this.questions);
    
      try {
        await this.service.answerQuizInitialProlog(answer).toPromise();
      } catch (error) {
        this.service.obtainAnswerQuizInitialProlog().subscribe((response: string) => {
          const r = response;
          this.conclusion = r || '';
          if (this.conclusion == "Vai iniciar um questionário de 40 perguntas") {
            this.canProceed = true;
            this.router.navigate(['/questionnaireProlog']);
          }
        });
      }
    }
    

    
  returnToHome() {
    this.router.navigate(['/']); // Redireciona o usuário de volta à página inicial
  }

  async continueQuestionnaire() {
    // Verifique se todas as perguntas foram respondidas
    if (this.questions.every(question => question.answer !== null)) {
      await this.obtainAnswer(); // Aguarde a conclusão da obtenção da resposta
      if(!this.canProceed) this.showWarning = true;
    } else {
      this.showWarning = true;
    }
  }
}

function createQuestionsFromString(inputString: string): Question[] {
  const lines = inputString.trim().split('\n');
  const questions: Question[] = [];

  for (let i = 0; i < lines.length; i += 2) {
      const id = parseInt(lines[i]);
      const questionText = lines[i + 1];

      if (!isNaN(id)) {
          const question = new Question(id, questionText);
          questions.push(question);
      }
  }
  return questions;
}

function createStringFromAnswers(questions: Question[]): string {
  let resultString = '';
  for (const question of questions) {
    if (question.getAnswer()) {
      resultString += question.getId() + '\n';
      resultString += question.getAnswer() + '\n';
    }
  }
  return resultString;
}
