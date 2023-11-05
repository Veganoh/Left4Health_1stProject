import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class QuestionnaireService {
  constructor(private http: HttpClient) { }

  public obtain40Questions(): Observable<string> {
    const options = { responseType: 'text' as 'json' }; // Set the responseType to 'text'
    return this.http.get("http://localhost:8081/api/obtain40Questions", options) as Observable<string>;
  }

  public answerQuizFinal(answer: string): Observable<string> {
    const options = { responseType: 'text' as 'json' };
    return this.http.post("http://localhost:8081/api/answerQuiz40", answer, options) as Observable<string>;
  }

  public obtain40QuestionsProlog(): Observable<string> {
    const options = { responseType: 'text' as 'json' }; // Set the responseType to 'text'
    return this.http.get("http://localhost:7071/api/obtain40Questions", options) as Observable<string>;
  }

  public answerQuizFinalProlog(answer: string): Observable<string> {
    const options = { responseType: 'text' as 'json' };
    return this.http.post("http://localhost:7071/api/answerQuiz40", answer, options) as Observable<string>;
  }
}
