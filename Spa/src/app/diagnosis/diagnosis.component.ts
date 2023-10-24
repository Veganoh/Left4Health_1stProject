import { Component } from '@angular/core';
import { Router } from '@angular/router'; // Importe o serviço Router

@Component({
  selector: 'app-diagnosis',
  templateUrl: './diagnosis.component.html',
  styleUrls: ['./diagnosis.component.scss']
})
export class DiagnosisComponent {
  constructor(private router: Router) {}

  // Função para voltar à página inicial
  goBackToHome() {
    this.router.navigate(['/']); // Redireciona para a página inicial
  }
}