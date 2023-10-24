package org.meia.model;

import java.util.List;

public class Quiz {
    private String version;
    private List<Question> QuizInitial;
    private List<QuestionCategory> Quiz40;

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version=version;
    }

    public List<Question> getQuizInitial() {
        return QuizInitial;
    }

    public void setQuizInitial(List<Question> quizInitial) {
        QuizInitial = quizInitial;
    }

    public List<QuestionCategory> getQuiz40() {
        return Quiz40;
    }

    public void setQuiz40(List<QuestionCategory> quiz40) {
        Quiz40 = quiz40;
    }
}
