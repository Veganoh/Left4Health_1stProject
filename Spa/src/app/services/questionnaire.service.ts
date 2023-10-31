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
    return this.http.get("http://localhost:8080/api/obtain40Questions", options) as Observable<string>;
  }
}
