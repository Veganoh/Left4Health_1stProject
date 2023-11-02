package org.meia.model;

public class Question {
    private String id;
    private String question;
    private String answer;
    private String questionType;

    public Question(String id, String question, String  questionType) {
        this.id = id;
        this.question = question;
        this.setQuestionType(questionType);
    }

    public Question() {
        answer =null;
    }

    public String getQuestionType() {
        return questionType;
    }

    public String getId() {
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


    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }
}
