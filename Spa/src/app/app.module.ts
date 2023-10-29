import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouterModule } from '@angular/router'; // Importe o RouterModule
import { FormsModule } from '@angular/forms'; // Importe o FormsModule

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { QuestionnaireComponent } from './questionnaire/questionnaire.component';
import { DiagnosisComponent } from './diagnosis/diagnosis.component';
import { HomeComponent } from './home/home.component';
import { QuestionnaireinitialComponent } from './questionnaireinitial/questionnaireinitial.component';

@NgModule({
  declarations: [
    AppComponent,
    QuestionnaireComponent,
    DiagnosisComponent,
    HomeComponent,
    QuestionnaireinitialComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    RouterModule, // Fornecendo explicitamente o RouterModule
    FormsModule // Adicione o FormsModule aqui
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

