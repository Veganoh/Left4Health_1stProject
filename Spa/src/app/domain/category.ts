export class Category {
    private regra1: string;
    private regra2: string;
    private questions: string[];
    private score: string;

    constructor() {
        this.regra1 = "";
        this.regra2 = "";
        this.questions = [];
        this.score = "";
    }

    public getRegra1(): string {
        return this.regra1;
    }

    public setRegra1(regra1: string): void {
        this.regra1 = regra1;
    }

    public getRegra2(): string {
        return this.regra2;
    }

    public setRegra2(regra2: string): void {
        this.regra2 = regra2;
    }

    public getScore(): string {
        return this.score;
    }

    public setScore(score: string): void {
        this.score = score;
    }

    public addQuestion(question: string): void {
        this.questions.push(question);
    }

    public getQuestions(): string[] {
        return this.questions;
    }
}
