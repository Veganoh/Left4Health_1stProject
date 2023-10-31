import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class QuestionnaireInitialService {
  constructor(private http: HttpClient) { }

  public obtainInitialQuestions(): Observable<string> {
    const options = { responseType: 'text' as 'json' }; // Set the responseType to 'text'
    return this.http.get("http://localhost:8080/api/obtainInitialQuestions", options) as Observable<string>;
  }

  public answerQuizInitial(answer: string): Observable<string> {
    const options = { responseType: 'text' as 'json' };
    return this.http.post("http://localhost:8080/api/answerQuizInitial", answer, options) as Observable<string>;
  }
}
