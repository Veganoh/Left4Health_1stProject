package org.meia.model;

import org.meia.anxietyDiagnosis.AnxietyDiagnosis;

public class Answer extends Fact {

    private String question;

    private Integer answer;

    private String category;

    private Integer questionId;

    public Answer(Integer questionId, String question, String answer, String category){
        this.questionId = questionId;
        this.question = question;
        this.answer = Integer.parseInt(answer);
        this.category = category;
        AnxietyDiagnosis.agendaEventListener.addRhs(this);
    }

    public Integer getQuestionId() {
        return questionId;
    }

    public Integer getAnswer() {
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
        return "Answer{" +
                "question='" + question + '\'' +
                ", answer=" + answer +
                '}';
    }
}
