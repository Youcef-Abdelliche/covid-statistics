Map<String, Question> questions = {
  "Question1": Question(
    title: "What is a coronavirus?",
    answer:
        "Coronaviruses are a large family of viruses which may cause illness in animals or humans.  In humans, several coronaviruses are known to cause respiratory infections ranging from the common cold to more severe diseases such as Middle East Respiratory Syndrome (MERS) and Severe Acute Respiratory Syndrome (SARS). The most recently discovered coronavirus causes coronavirus disease COVID-19.",
  ),
  "Question2": Question(
    title: "What is COVID-19?",
    answer:
        "COVID-19 is the infectious disease caused by the most recently discovered coronavirus. This new virus and disease were unknown before the outbreak began in Wuhan, China, in December 2019. COVID-19 is now a pandemic affecting many countries globally.",
  ),
  "Question3": Question(
    title: "What are the symptoms of COVID-19?",
    answer:
        "The most common symptoms of COVID-19 are fever, dry cough, and tiredness. Other symptoms that are less common and may affect some patients include aches and pains, nasal congestion, headache, conjunctivitis, sore throat, diarrhea, loss of taste or smell or a rash on skin or discoloration of fingers or toes. These symptoms are usually mild and begin gradually. Some people become infected but only have very mild symptoms.Most people (about 80%) recover from the disease without needing hospital treatment. Around 1 out of every 5 people who gets COVID-19 becomes seriously ill and develops difficulty breathing. Older people, and those with underlying medical problems like high blood pressure, heart and lung problems, diabetes, or cancer, are at higher risk of developing serious illness.  However, anyone can catch COVID-19 and become seriously ill.  People of all ages who experience fever and/or  cough associated withdifficulty breathing/shortness of breath, chest pain/pressure, or loss of speech or movement should seek medical attention immediately. If possible, it is recommended to call the health care provider or facility first, so the patient can be directed to the right clinic.",
  ),
  "Question4": Question(
    title:
        "What should I do if I have COVID-19 symptoms and when should I seek medical care?",
    answer:
        "If you have minor symptoms, such as a slight cough or a mild fever, there is generally no need to seek medical care. Stay at home, self-isolate and monitor your symptoms. Follow national guidance on self-isolation.However, if you live in an area with malaria or dengue fever it is important that you do not ignore symptoms of fever.  Seek medical help.  When you attend the health facility wear a mask if possible, keep at least 1 metre distance from other people and do not touch surfaces with your hands. If it is a child who is sick help the child stick to this advice.Seek immediate medical care if you have difficulty breathing or pain/pressure in the chest. If possible, call your health care provider in advance, so he/she can direct you to the right health facility.",
  ),
  "Question5": Question(
    title: "Can COVID-19 be caught from a person who has no symptoms?",
    answer:
        "COVID-19 is mainly spread through respiratory droplets expelled by someone who is coughing or has other symptoms such as fever or tiredness. Many people with COVID-19 experience only mild symptoms. This is particularly true in the early stages of the disease. It is possible to catch COVID-19 from someone who has just a mild cough and does not feel ill.Some reports have indicated that people with no symptoms can transmit the virus. It is not yet known how often it happens. WHO is assessing ongoing research on the topic and will continue to share updated findings.",
  ),
  "Question6": Question(
    title:
        "How can we protect others and ourselves if we don't know who is infected?",
    answer:
        "If you have been in close contact with someone with COVID-19, you may be infected.Close contact means that you live with or have been in settings of less than 1 metre from those who have the disease. In these cases, it is best to stay at home.However, if you live in an area with malaria or dengue fever it is important that you do not ignore symptoms of fever. Seek medical help. When you attend the health facility wear a mask if possible, keep at least 1 metre distant from other people and do not touch surfaces with your hands. If it is a child who is sick help the child stick to this advice.If you do not live in an area with malaria or dengue fever please do the following:If you become ill, even with very mild symptoms you must self-isolateEven if you don’t think you have been exposed to COVID-19 but develop symptoms, then self-isolate and monitor yourselfYou are more likely to infect others in the early stages of the disease when you just have mild symptoms, therefore early self-isolation is very important.If you do not have symptoms, but have been exposed to an infected person, self-quarantine for 14 days.If you have definitely had COVID-19 (confirmed by a test) self-isolate for 14 days even after symptoms have disappeared as a precautionary measure – it is not yet known exactly how long people remain infectious after they have recovered. Follow national advice on self-isolation.",
  ),
  "Question7": Question(
    title:
        "What should I do if I have come in close contact with someone who has COVID-19?",
    answer:
        "Quarantine means restricting activities or separating people who are not ill themselves but may have been exposed to COVID-19. The goal is to prevent spread of the disease at the time when people just develop symptoms..Isolation means separating people who are ill with symptoms of COVID-19 and may be infectious to prevent the spread of the disease.Physical distancing means being physically apart. WHO recommends keeping at least 1-metre distance from others. This is a general measure that everyone should take even if they are well with no known exposure to COVID-19. ",
  ),
};

class Question {
  String title;
  String answer;
  Question({
    this.title,
    this.answer,
  });
}
