import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Question } from '../domain/question';
import { QuestionnaireService } from '../services/questionnaire.service'

@Component({
  selector: 'app-questionnaire',
  templateUrl: './questionnaire.component.html',
  styleUrls: ['./questionnaire.component.scss'],
  providers: [QuestionnaireService]
})
export class QuestionnaireComponent implements OnInit {
  currentPage: number = 1;

  questionsPage1: Question[] = [];
  questionsPage2: Question[] = [];


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
        const questions = createQuestionsFromString(inputString);
  
        // Divide as 40 perguntas em duas listas de 20 perguntas cada
        this.questionsPage1 = questions.slice(0, 20);
        this.questionsPage2 = questions.slice(20, 40);
      });
    }

  nextPage() {
    this.currentPage = 2;
  }

  goToPage(page: number) {
    this.currentPage = page;
  }

  submitForm() {
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