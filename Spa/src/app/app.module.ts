import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouterModule } from '@angular/router'; 
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { NgChartsModule  } from 'ng2-charts'; 


import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { QuestionnaireComponent } from './questionnaire/questionnaire.component';
import { DiagnosisComponent } from './diagnosis/diagnosis.component';
import { HomeComponent } from './home/home.component';
import { QuestionnaireinitialComponent } from './questionnaireinitial/questionnaireinitial.component';

import { QuestionnaireInitialPrologComponent } from './prolog/questionnaire-initial-prolog/questionnaire-initial-prolog.component';
import { QuestionnairePrologComponent } from './prolog/questionnaire-prolog/questionnaire-prolog.component';

@NgModule({
  declarations: [
    AppComponent,
    QuestionnaireComponent,
    DiagnosisComponent,
    HomeComponent,
    QuestionnaireinitialComponent,
    QuestionnaireInitialPrologComponent,
    QuestionnairePrologComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    RouterModule, 
    FormsModule, 
    HttpClientModule,
    NgChartsModule 
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

