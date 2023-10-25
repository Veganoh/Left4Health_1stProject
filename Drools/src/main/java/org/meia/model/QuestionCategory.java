package org.meia.model;

import java.util.List;

public class QuestionCategory {

    private String category;

    private List<Question> categoryQuestionList;



    public QuestionCategory(String category, List<Question> categoryQuestionList) {
        this.category=category;
        this.categoryQuestionList = categoryQuestionList;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public List<Question> getCategoryQuestionList() {
        return categoryQuestionList;
    }

    public void setCategoryQuestionList(List<Question> categoryQuestionList) {
        this.categoryQuestionList = categoryQuestionList;
    }

    @Override
    public String toString() {
        return "QuestionCategory{" +
                "category='" + category + '\'' +
                ", categoryQuestionList=" + categoryQuestionList +
                '}';
    }
}
