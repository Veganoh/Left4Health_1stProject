import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-questionnaireinitial',
  templateUrl: './questionnaireinitial.component.html',
  styleUrls: ['./questionnaireinitial.component.scss']
})
export class QuestionnaireinitialComponent {
  questions: any[] = [
    { text: 'Esta é a primeira pergunta?', answer: null },
    { text: 'Esta é a segunda pergunta?', answer: null },
    { text: 'Esta é a terceira pergunta?', answer: null },
    // Adicione mais perguntas aqui
  ];

  showWarning: boolean = false;

  constructor(private router: Router) {} // Injete o serviço Router no construtor

  returnToHome() {
    this.router.navigate(['/']); // Redireciona o usuário de volta à página inicial
  }

  continueQuestionnaire() {
    // Verifique se todas as perguntas foram respondidas
    if (this.questions.every(question => question.answer !== null)) {
      // Todas as perguntas foram respondidas, redirecione para a próxima etapa
      this.router.navigate(['/questionnaire']); // Substitua 'questionnaire' pela rota correta
    } else {
      // Aviso caso algumas perguntas não tenham sido respondidas
      this.showWarning = true;
    }
  }
  
}

