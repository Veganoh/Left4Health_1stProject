import { Component } from '@angular/core';
import { Router } from '@angular/router'; // Importe o serviço Router

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent {
  selectedTool: string = ''; // Para rastrear a escolha do paciente

  constructor(private router: Router) {} // Injete o serviço Router no construtor

  selectTool(tool: string) {
    this.selectedTool = tool;
  }

  redirectToQuestionnaire() {
    // Redirecione o usuário para a página do questionário usando o serviço Router
    this.router.navigate(['/questionnaire']); // Certifique-se de configurar a rota corretamente no arquivo de roteamento
  }
}
