import { Component, OnInit } from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';
import { Category } from 'src/app/domain/category'; 

@Component({
  selector: 'app-diagnosis',
  templateUrl: './diagnosis.component.html',
  styleUrls: ['./diagnosis.component.scss']
})
export class DiagnosisComponent implements OnInit {
  diagnosis: Category[] = [];
  positiveDiagnosis: Category[] = [];
  negativeDiagnosis: Category[] = [];
  buttonClicked: boolean = false;


  constructor(private router: Router) {}

  ngOnInit(): void {
    let isNavigationDataAvailable = false;
  
    this.router.events.subscribe((event) => {
      if (event instanceof NavigationEnd) {
        const navigation = this.router.getCurrentNavigation();
        if (navigation) {
          const state = navigation.extras.state as { diagnosis: Category[] };
          if (state && state.diagnosis) {
            this.diagnosis = state.diagnosis;
            this.getDiagnosis();
            isNavigationDataAvailable = true;
            console.log(this.diagnosis.length);
            console.log(this.positiveDiagnosis);
            console.log(this.negativeDiagnosis);
          }
        }
      }
    });
    console.log(this.diagnosis);
    console.log(this.positiveDiagnosis);
  }
  

  getDiagnosis() {
    for (const category of this.diagnosis) {
        const score = category.score;
        if(score >= 15) this.positiveDiagnosis.push(category);
        else this.negativeDiagnosis.push(category) 
    }
  }
  
  checkResults() {
    this.buttonClicked = true;
    // Outras ações que você deseja realizar quando o botão é clicado
  }
  

  returnToHome() {
    this.router.navigate(['/']); 
  }
}