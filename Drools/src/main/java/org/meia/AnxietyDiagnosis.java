package org.meia;

import org.meia.model.*;

import org.kie.api.KieServices;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;
import org.kie.api.runtime.rule.LiveQuery;
import org.kie.api.runtime.rule.Row;
import org.kie.api.runtime.rule.ViewChangedEventListener;


public class AnxietyDiagnosis {

    public static final void main(String[] args) {

        JsonReader jsonReader  = new JsonReader();
        Quiz quizJSON = jsonReader.readJsonFromFile();
        jsonReader.printJsonFromResource(quizJSON);

        /*QuizInitial quizInitial=jsonReader.readQuizInitial();
        jsonReader.printJsonFromResource2(quizInitial);*/




       /*Question pergunta1 = new Question("Pergunta 1", "Sim");
        Question pergunta2 = new Question("Pergunta 2", "Não");
        Question pergunta3 = new Question("Pergunta 3", "Sim");

        quizJSON.addQuestion(pergunta1);
        quizInitial.addQuestion(pergunta2);
        quizInitial.addQuestion(pergunta3);

        runEngine(quizInitial);*/


    }

    private static void runEngine(Quiz quizInitial) {
        try {
            // load up the knowledge base
            KieServices ks = KieServices.Factory.get();
            KieContainer kContainer = ks.getKieClasspathContainer();
            final KieSession kSession = kContainer.newKieSession("ksession-rules");
            // session name defined in kmodule.xml"

            // Query listener
            ViewChangedEventListener listener = new ViewChangedEventListener() {
                @Override
                public void rowDeleted(Row row) {
                }

                @Override
                public void rowInserted(Row row) {
                    Conclusion conclusion = (Conclusion) row.get("$conclusion");
                    //System.out.println(">>>" + conclusion.toString());
                    System.out.println(">>>" + conclusion.toString());
                    // stop inference engine after as soon as got a conclusion
                    kSession.halt();

                }

                @Override
                public void rowUpdated(Row row) {
                }

            };
            LiveQuery query = kSession.openLiveQuery("Conclusions", null, listener);

            kSession.insert(quizInitial);

            kSession.fireAllRules();
            // kSession.fireUntilHalt();

            query.close();

        } catch (Throwable t) {
            t.printStackTrace();
        }
    }
}
