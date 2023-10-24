package org.meia.model;

import java.util.List;

public class QuizInitial {
    private List<Question> questionList;

    public List<Question> getQuestionList() {
        return questionList;
    }

    public void setQuestionList(List<Question> questionList) {
        this.questionList = questionList;
    }

    @Override
    public String toString() {
        String x="";
        for (Question question: this.questionList){
            x=x+question.toString();
        }
        return x;
    }
}
