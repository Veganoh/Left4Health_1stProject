import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Question } from '../domain/question';
import { QuestionnaireService } from '../services/questionnaire.service';
import { Category } from '../domain/category';


@Component({
  selector: 'app-questionnaire',
  templateUrl: './questionnaire.component.html',
  styleUrls: ['./questionnaire.component.scss'],
  providers: [QuestionnaireService]
})
export class QuestionnaireComponent implements OnInit {
  currentPage: number = 1;

  questions: Question[] = [];
  questionsPage1: Question[] = [];
  questionsPage2: Question[] = [];
  diagnosis: Category[] = [];


  constructor(
    private router: Router,
    private service : QuestionnaireService
    ) {} 

    ngOnInit(): void {
      this.obtainQuestions();
    }

    obtainQuestions(): void {
      this.service.obtain40Questions().subscribe((response: string) => {
        const inputString = response;
        this.questions = createQuestionsFromString(inputString);
  
        // Divide as 40 perguntas em duas listas de 20 perguntas cada
        this.questionsPage1 = this.questions.slice(0, 20);
        this.questionsPage2 = this.questions.slice(20, 40);
      });
    }

    async obtainAnswer(): Promise<void> {
      const answer = createStringFromAnswers(this.questions);
      try {
        const response = await this.service.answerQuizFinal(answer).toPromise();
        if (response) {
          this.diagnosis = createCategoriesFromString(response);
        } else {
          console.error('Resposta da API é indefinida');
        }
      } catch (error) {
        console.error('Erro na chamada da API:', error);
      }
    }

  nextPage() {
    console.log(this.questionsPage1)
    this.currentPage = 2;
  }

  goToPage(page: number) {
    this.currentPage = page;
  }

  submitForm() {
    console.log(this.questionsPage2)
    this.obtainAnswer();
    console.log(this.diagnosis)
    // Lógica para processar as respostas do questionário

    // Redirecione o usuário para a página de diagnóstico após a submissão
    this.router.navigate(['/diagnosis']);
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

function createCategoriesFromString(inputString: string): Category[] {
  const lines = inputString.trim().split('\n');
  const categories: Category[] = [];

  for(let i = 0; i < lines.length; i+= 8){
    const currentCategory = new Category();

    currentCategory.setRegra1(lines[i]);
    currentCategory.setScore(lines[i+1]);
    currentCategory.setRegra2(lines[i+2])
    currentCategory.addQuestion(lines[i+3])
    currentCategory.addQuestion(lines[i+4])
    currentCategory.addQuestion(lines[i+5])
    currentCategory.addQuestion(lines[i+6])
    currentCategory.addQuestion(lines[i+7])
    categories.push(currentCategory);
  }
  console.log(categories)
  return categories;
}



