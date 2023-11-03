export class Category {
    public regra1: string;
    public regra2: string;
    public questions: string[];
    public score: number; // Alterado o tipo para number

    constructor() {
        this.regra1 = "";
        this.regra2 = "";
        this.questions = [];
        this.score = 0; // Inicializado com 0 como um número inteiro
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

    public getScore(): number { // Alterado o tipo de retorno para number
        return this.score;
    }

    public setScore(score: string): void {
        this.score = parseInt(score, 10); // Faz o parse da string para um número inteiro
    }

    public addQuestion(question: string): void {
        this.questions.push(question);
    }

    public getQuestions(): string[] {
        return this.questions;
    }
}
