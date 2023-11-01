import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { QuestionnaireInitialService } from '../services/questionnaireinitial.service';
import { Question } from '../domain/question';


@Component({
  selector: 'app-questionnaireinitial',
  templateUrl: './questionnaireinitial.component.html',
  styleUrls: ['./questionnaireinitial.component.scss'],
  providers: [QuestionnaireInitialService]
})


export class QuestionnaireinitialComponent implements OnInit{
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
    this.service.obtainInitialQuestions().subscribe((response: string) => {
      // Crie uma lista de perguntas com base na string
      const inputString = response;
      this.questions = createQuestionsFromString(inputString);
    });
  }

  async obtainAnswer(): Promise<void> {
    this.canProceed = false;
    const answer = createStringFromAnswers(this.questions);
    try {
      const response = await this.service.answerQuizInitial(answer).toPromise();
      this.conclusion = response || ''; // Usar uma string vazia como valor padrão se a resposta for undefined
      if (this.conclusion == "Vai iniciar um questionário de 40 perguntas") {
        this.canProceed = true;
  
        // Execute a navegação para a próxima página aqui, pois a resposta da API foi recebida com sucesso
        this.router.navigate(['/questionnaire']);
      }
    } catch (error) {
      // Lógica para tratar erros na chamada da API, se necessário
      console.error('Erro na chamada da API:', error);
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
  
      // A navegação para a próxima página agora ocorre dentro do método obtainAnswer()
    
    
    } else {
      // Aviso caso algumas perguntas não tenham sido respondidas
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

/**
 * This method receives the answers and transforms them into a string
 * @param questions 
 * @returns 
 */
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