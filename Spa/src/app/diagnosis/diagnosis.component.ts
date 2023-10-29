import { Component } from '@angular/core';
import { Router } from '@angular/router'; // Importe o serviço Router

@Component({
  selector: 'app-diagnosis',
  templateUrl: './diagnosis.component.html',
  styleUrls: ['./diagnosis.component.scss']
})
export class DiagnosisComponent {
  diagnoses: any[] = [
    {
      type: 'AgoraFobia',
      answers: [
        { question: 'Você tem medo de sair de casa sozinho(a) e, portanto, raramente o faz, mesmo para atividades simples como ir à mercearia ou ao correio?', answer: 5 },
        { question: 'Você sente ansiedade intensa ao pensar em estar em uma fila, em um local lotado ou em meio a multidões?', answer: 5 },
        { question: 'Você evita viajar em transportes públicos, como ônibus ou metrô, devido ao medo de ter um ataque de pânico ou outra situação desconfortável?', answer: 5 },
      ]
    },
    // Adicione mais diagnósticos aqui
  ];

  constructor(private router: Router) {}

  returnToHome() {
    this.router.navigate(['/']); // Redireciona o usuário de volta à página inicial
  }
}

