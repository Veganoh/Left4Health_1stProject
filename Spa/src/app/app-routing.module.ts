import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { QuestionnaireComponent } from './questionnaire/questionnaire.component';
import { DiagnosisComponent } from './diagnosis/diagnosis.component';
import { QuestionnaireinitialComponent } from './questionnaireinitial/questionnaireinitial.component';
import { ChartsComponent } from './charts/charts.component'
import { QuestionnaireInitialPrologComponent } from './prolog/questionnaire-initial-prolog/questionnaire-initial-prolog.component';
import { QuestionnairePrologComponent } from './prolog/questionnaire-prolog/questionnaire-prolog.component';

const routes: Routes = [
  { path: '', component: HomeComponent }, // Rota da página inicial
  { path: 'questionnaire', component: QuestionnaireComponent }, // Rota do questionário
  { path: 'diagnosis', component: DiagnosisComponent }, // Rota para o componente "diagnosis"
  { path: 'questionnaireinitial', component: QuestionnaireinitialComponent }, // Rota para o componente "questionnaireinitial"
  { path: 'questionnaireinitialProlog', component: QuestionnaireInitialPrologComponent }, // Rota para o componente "questionnaireinitialProlog"
  { path: 'questionnaireinitial', component: QuestionnaireinitialComponent },
  { path: 'questionnaireProlog', component: QuestionnairePrologComponent},
  { path: 'charts', component: ChartsComponent } // Rota para o componente "questionnaireinitial"
  // Outras rotas do seu aplicativo

  
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {}