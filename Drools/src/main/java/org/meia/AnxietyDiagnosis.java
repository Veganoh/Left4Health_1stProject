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

        Quiz quiz;
        JsonReader jsonReader = new JsonReader();

        quiz=jsonReader.readQuizInitial();

        if (quiz == null) {
            System.out.println("Falha ao ler o arquivo JSON.");
        } else {
            // Acessar e imprimir as perguntas em QuizInitial
            //System.out.println(quiz.toStringInitial());
        }


        KieServices kieServices = KieServices.Factory.get();
        KieContainer kieContainer = kieServices.getKieClasspathContainer();
        KieSession kieSession = kieContainer.newKieSession("ksession-rules");

        // Inserir o objeto Quiz na sessão do Drools
        kieSession.insert(quiz);

        // Executar as regras do Drools
        int rulesFired = kieSession.fireAllRules();

        // Verificar se a conclusão foi gerada
        boolean conclusionGenerated = rulesFired > 0;

        kieSession.dispose();
        //runEngine(quiz);

  /*      // Se nenhuma conclusão foi gerada, atribuir valores ao array
        if (!conclusionGenerated) {
            // Atribuir valores ao QUIZ40
            jsonReader.readQuiz40(quiz);
            //System.out.println(quiz.toString40());

            KieServices kieServices2 = KieServices.Factory.get();
            KieContainer kieContainer2 = kieServices2.getKieClasspathContainer();
            KieSession kieSession2 = kieContainer2.newKieSession("ksession-rules");

            // Inserir o objeto Quiz na sessão do Drools
            kieSession2.insert(quiz);

            // Executar as regras do Drools
             kieSession2.fireAllRules();

            kieSession2.dispose();
        } else {
            System.out.println("Uma conclusão foi gerada, não atribuir valores ao quiz40.");
        }*/

        // Fechar a sessão do Drools



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
