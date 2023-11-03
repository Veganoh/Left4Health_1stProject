import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Category } from 'src/app/domain/category'; 
import { Question } from 'src/app/domain/question';

@Component({
  selector: 'app-diagnosis',
  templateUrl: './diagnosis.component.html',
  styleUrls: ['./diagnosis.component.scss']
})
export class DiagnosisComponent implements OnInit {
  diagnoses: Category[] = [];

  constructor(private router: Router) {}

  ngOnInit(): void {
    const navigation = this.router.getCurrentNavigation();
    if (navigation && navigation.extras.state) {
      this.diagnoses = navigation.extras.state['diagnosis'];

   
      this.calculateDiagnoses();
    }
    console.log("entrei");
    console.log(this.diagnoses);
  }

  calculateDiagnoses() {
    for (const category of this.diagnoses) {
      let score = 0;
      for (const question of category.getQuestions()) {
        //if (question.getAnswer() === 'sim') {
          score += 1;
        }
      }

      
      if (score >= 15) {
        category.setRegra1('Sua regra1');
      } else {
        category.setRegra2('Sua regra2');
      }

      category.setScore(score.toString());
    }
  }

  returnToHome() {
    this.router.navigate(['/']); 
  }
}