import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-questionnaire',
  templateUrl: './questionnaire.component.html',
  styleUrls: ['./questionnaire.component.scss']
})
export class QuestionnaireComponent {
  currentPage: number = 1;
  questionsPage1: string[] = [
    'Pergunta 1',
    'Pergunta 2',
    'Pergunta 3',
    'Pergunta 4',
    'Pergunta 5',
    'Pergunta 6',
    'Pergunta 7',
    'Pergunta 8',
    'Pergunta 9',
    'Pergunta 10',
    'Pergunta 11',
    'Pergunta 12',
    'Pergunta 13',
    'Pergunta 14',
    'Pergunta 15',
    'Pergunta 16',
    'Pergunta 17',
    'Pergunta 18',
    'Pergunta 19',
    'Pergunta 20'
  ];

  questionsPage2: string[] = [
    'Pergunta 21',
    'Pergunta 22',
    'Pergunta 23',
    'Pergunta 24',
    'Pergunta 25',
    'Pergunta 26',
    'Pergunta 27',
    'Pergunta 28',
    'Pergunta 29',
    'Pergunta 30',
    'Pergunta 31',
    'Pergunta 32',
    'Pergunta 33',
    'Pergunta 34',
    'Pergunta 35',
    'Pergunta 36',
    'Pergunta 37',
    'Pergunta 38',
    'Pergunta 39',
    'Pergunta 40'
  ];

  constructor(private router: Router) {}

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