export class Question {

    private id : number;

    public question: string;

    public answer : string | null;

    constructor(id : number, question: string){
        this.id = id;
        this.question = question;
        this.answer = null;
    }

 
    public getId(): number {
        return this.id;
    }
  
    public getQuestion(): string {
        return this.question;
    }
  
    public getAnswer(): string | null {
        return this.answer;
    }

    public setAnswer(answer: string): void {
        this.answer = answer;
    }

    
}

