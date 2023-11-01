export class Category {
    private diagnosis: string;
    private questions: string[];
    private answers: string[];

    constructor() {
        this.diagnosis = "";
        this.answers = [];
        this.questions = [];
    }

    public getDiagnosis(): string {
        return this.diagnosis;
    }

    public setDiagnosis(diagnosis: string): void {
        this.diagnosis = diagnosis;
    }

    public getAnswers(): string[] {
        return this.answers;
    }

    public addAnswer(answer: string): void {
        this.answers.push(answer);
    }

    public addQuestion(question: string): void {
        this.questions.push(question);
    }

    public getQuestions(): string[] {
        return this.questions;
    }

}

