package org.meia.model;

import org.meia.anxietyDiagnosis.AnxietyDiagnosis;

public class Answer extends Fact {

    private String question;

    private int answer;

    private String category;

    private String questionId;

    public Answer(String questionId, String question, String answer, String category){
        this.questionId = questionId;
        this.question = question;
        this.answer = Integer.parseInt(answer);
        this.category = category;
        AnxietyDiagnosis.agendaEventListener.addRhs(this);
    }


    public String getQuestionId() {
        return questionId;
    }

    public int getAnswer() {
        return answer;
    }

    public String getCategory() {
        return category;
    }
    public String getQuestion() {
        return question;
    }

    @Override
    public String toString() {
        return getQuestion() + "\n" +getAnswer();
    }
}
