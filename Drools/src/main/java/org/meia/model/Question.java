package org.meia.model;

public class Question {
    private int id;
    private String question;
    private String answer;
    private QuestionType questionType;

    public Question(int id, String question, String questionType) {
        this.id = id;
        this.question = question;
        this.questionType = QuestionType.fromValue(questionType);
    }

    public Question() {
        // Deixa os atributos não inicializados
    }

    public String getQuestionType() {
        return questionType.getValue();
    }

    public int getId() {
        return id;
    }

    public String getQuestion() {
        return question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        return answer;
    }
}
