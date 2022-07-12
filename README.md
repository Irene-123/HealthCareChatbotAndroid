Healthcare chatbot that simulates one on one conversation with users and helps to diagnose there diseases.

## My contributions to the repository for Back end model using knowledge Graphs & NLU. 
- [Answer to the user their probable diseases and nearest doctors](https://github.com/xzaviourr/HealthcareChatbot)


This project is a starting point for a Flutter application.
# Health Care Chatbot using Knowledge graphs + Text classification. 

Knowledge graphs combine characteristics of several data management paradigms:

Database, because the data can be explored via structured queries;
Graph, because they can be analyzed as any other network data structure;
Knowledge base, because they bear formal semantics, which can be used to interpret the data and infer new facts.

## Here, Knowledge graphs are created using GraphQL (like SQL) on **neo4j** platform. 
### Neo4j
![2022-02-25_18-12](https://user-images.githubusercontent.com/58950467/155717185-cc8ad058-efb1-4327-ace3-493f9ed11f67.png)

![2022-02-25_18-10](https://user-images.githubusercontent.com/58950467/155717201-bf1d5e03-1c37-4e51-a9c8-fad58f9e6516.png)


## Python wrapper (py2neo) for connecting graph database is used. 
The python wrapper of neo4j is used to create the knowledge graph with specified nodes & relationships.
> The GraphQL queries returns the data demanded from the node or relationship

## Question-Answer Dataset 
https://github.com/LasseRegin/medical-question-answer-data

## Disease Dataset
https://github.com/liuhuanyong/QASystemOnMedicalKG/blob/master/data/medical.json
https://www.kaggle.com/priya1207/diseases-dataset
https://www.kaggle.com/usamag123/disease-prediction-through-symptoms

## Medical terms dictionary
https://www.medicinenet.com/script/main/alphaidx.asp?p=a_dict

# Result
After running queries in graphQL on neo4j browser, the output shows all relationships and nodes as: 

![76ac812d-8775-4df0-b98b-a56205f41a38](https://user-images.githubusercontent.com/58950467/155718268-296b8378-0a67-4626-8ebd-df85c7a7e21d.jpeg)


## User can ask for probable diseases based on their symptoms. 

![image](https://user-images.githubusercontent.com/58950467/162941682-fa413e6f-f087-492e-86e8-2f65a1de1727.png)

The underlying back end process can also suggest user the best foods, drugs, and the type of disease it could be. 

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
