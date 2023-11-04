import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent {
  selectedTool: string = '';

  constructor(private router: Router) {}

  selectTool(tool: string) {
    this.selectedTool = tool;
  }

  redirectToQuestionnaireinitial() {
    if (this.selectedTool === 'prolog') {
      this.router.navigate(['/questionnaireinitialProlog']);
    } else {
      this.router.navigate(['/questionnaireinitial']);
    }
  }
}
