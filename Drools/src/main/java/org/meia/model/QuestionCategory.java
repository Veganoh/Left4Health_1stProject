package org.meia.model;

import java.util.List;

public class QuestionCategory {
    private String category;
    private List<Question> categoryQuestionList;

    public String getCategory() {
        return category;
    }

    public List<Question> getCategoryQuestionList() {
        return categoryQuestionList;
    }

    @Override
    public String toString() {
        return "QuestionCategory{" +
                "category='" + category + '\'' +
                ", categoryQuestionList=" + categoryQuestionList +
                '}';
    }
}
