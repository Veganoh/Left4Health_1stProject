import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-diagnosis',
  templateUrl: './diagnosis.component.html',
  styleUrls: ['./diagnosis.component.scss']
})
export class DiagnosisComponent implements OnInit {
  diagnoses: any[] = [];

  constructor(private router: Router) {}

  ngOnInit(): void {
    const navigation = this.router.getCurrentNavigation();
    if (navigation && navigation.extras.state) {
      this.diagnoses = navigation.extras.state['diagnosis'];
    }
    console.log("entrei");
    console.log(this.diagnoses)
  }

  returnToHome() {
    this.router.navigate(['/']); // Redireciona o usuário de volta à página inicial
  }
}
