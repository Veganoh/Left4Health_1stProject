import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component'; // Importe o componente da página inicial
import { QuestionnaireComponent } from './questionnaire/questionnaire.component'; // Importe o componente do questionário
import { DiagnosisComponent } from './diagnosis/diagnosis.component'; // Certifique-se de importar seu componente "diagnosis"

const routes: Routes = [
  { path: '', component: HomeComponent }, // Rota da página inicial
  { path: 'questionnaire', component: QuestionnaireComponent }, // Rota do questionário
  { path: 'diagnosis', component: DiagnosisComponent }, // Rota para o componente "diagnosis"
  // Outras rotas do seu aplicativo
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {}