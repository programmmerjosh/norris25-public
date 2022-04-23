//
//  Questionaires.swift
//  Norris 25
//
//  Created by Joshua Van Niekerk on 08/05/2020.
//  Copyright © 2020 Josh-Dog101. All rights reserved.
//

import Foundation

class Questionaires {
    
    var list = [Questionaire]()
    
    init() {
        list.append(Questionaire(
            title: "Fitness",
            questions: [
                "1. Do you exercise at least 3 days a week for at least 25 mins each day?",
                "2. Do you have and use a nutritional eating plan?",
                "3. Do you get your 5 fruit & veg a day?",
                "4. Do you drink at least 1.5 litres (6 glasses) of water a day?",
                "5. Do you have fitness goals and are you trying to achieve them?",
                "6. Is your BMI (Body Mass Index) in the normal category?",
                "7. Do you push yourself relatively hard (according to your capacity) in your exercises?",
                "8. Looking back on the past 2 months, can you see or feel any physical improvements?",
                "9. Are you within a 10kg radius of your goal weight?",
                "10. Do you do at least 25 minutes of high-intensity interval/cardio per week?",
                "11. Do you monitor or get your blood pressure, cholesterol, blood sugar and resting heart rate checked every 6 to 12 months?",
                "12. Do you make a conscious effort to maintain and/or improve your flexibility and balance?",
                "13. Rest is as important as exercise, do you get at least 7 hours of sleep within every 24 hours?",
                "14. Do you stretch before and/or after your workout?",
                "15. Do you avoid processed foods?",
                "16. Do you manage your stress?",
        ]))
        
        list.append(Questionaire(
            title: "Business",
            questions: [
                "1. Do you have a list of meticulously well planned economic goals?",
                "2. Is the service or product you provide, valuable to the market place?",
                "3. Are the business prices competitive and profitable?",
                "4. Are at least the majority of your employees well motivated to do their part?",
                "5. Are there realistic incentives (goals and rewards for those goals) for the employees?",
                "6. Does your business often engage in networking events to meet with other professionals to share ideas and services?",
                "7. Do you surround yourself with the right people, mentors, strategic partners as well as a great team?",
                "8. Is the business staying current with emerging trends, needs and issues?",
                "9. Can you and do you keep track of any measurable progress in the business? This is crucial.",
                "10. Is risk management a priority in your business?",
                "11. Is the business making substantial profits?",
                "12. Between now and a year ago, has there been an increase in the business's market share?",
                "13. Do you always ensure that your intellectual property is protected?",
                "14. Do you keep your business separate from your personal life?",
                "15. If/when there is a situation/area in which you are not an expert in; do you first do the necessary research before taking on the task?",
                "16. Are you fully aware of your business's strengths and weaknesses?",
                "17. Is there a clear business objective?",
                "18. Is honesty and integrity an important factor in the business?",
                "19. Are you and/or your colleagues/employees prepared to put in more time than is required of them if necessary?",
                "20. Is client satisfaction a high priority of the business?"
        ]))
        
        list.append(Questionaire(
            title: "Personal Development",
            questions: [
                "1. Do you work harder on yourself (in terms of personal growth, studies, knowledge, understanding) than you do on your job?",
                "2. Do you have a list of long range goals (dreams, life goals)?",
                "3. Do you have a list of short range goals (goals for today, tomorrow, this week, this month, this year)?",
                "4. Do you have a list of personal development goals?",
                "5. Do you affirm/encourage yourself everyday?",
                "6. Do you avoid negativity in your life?",
                "7. Do you take responsibility for what is going wrong in your life?",
                "8. Do you keep track of the progresses you make in life?",
                "9. Do you have a list of the things you want in life (big and small; affordable and out of your immediate reach)?",
                "10. When you want something badly in life, do you relentlessly pursue it without giving up?",
                "11. When you have achieved a big goal or something you’ve worked for for a while, do you celebrate that achievement?",
                "12. Do you read at least one book a year on the area you want to grow/excel in?",
                "13. Do you honestly and genuinely want to make a difference in the world?",
                "14. By the end of each day, do you make sure you've had at least one valuable experience or acquired some emotional content that day?",
                "15. Do you value yourself?",
                "16. Do you value what you can do and/or what you're capable of?",
                "17. Do other people value what you do?",
                "18. Do you give your best in everything you do?",
                "19. Do you value your time?",
                "20. Are you willing to sacrifice at least 40% of your television time to working on your dreams and goals?"]))
        
 
            list.append(Questionaire(
                title: "Gym Junky",
                questions: [
                "1. If you can do 2 more reps with a particular weight that you started out with, do you increase the weight?",
                "2. Do you change up your workout routine from time to time?",
                "3. Do you make sure you are well hydrated at least 30 minutes before every workout?",
                "4. Are you doing your bodyweight exercises in the gym?",
                "5. Do you drink at least 2 litres (8 glasses) of water a day?",
                "6. Are you consistent with your nutritional eating plan?",
                "7. Do you make sure you get in your leg day(s) every week?",
                "8. Are you getting natural fats in you diet?",
                "9. Are you getting in your lean, natural protein?",
                "10. Are you getting in your core/ab training in every week?",
                "11. Are you taking anything (i.e creatine or BCAAs) for recovery?",
                "12. Do you always remember to warm up before your intense training?",
                "13. Do you have a goal weight and are you working towards it or maintaining it?",
                "14. Are you consistently pushing yourself in the gym?",
                "15. Are you getting sufficient rest every week?",
                "16. Are you disciplined in what you eat and how often you eat?",
                "17. Are you certain that you aren't undertraining or overtraining?",
                "18. Are these exercises an important part of your routines? [Squats, Deadlifts, Bench Press, Clean and Jerk, Overhead Press, Good Mornings, Pullups, Pushups]",
                "19. Do you time your rests between sets and try keep them short?",
                "20. Do you at least occasionally incorporate the shocking principle?"
            ]))
        
            list.append(Questionaire(
                title: "Family And Relationships",
                questions: [
                "1. Do you generally respect the people you associate with and your family?",
                "2. Do you ever do things for people without being asked to do them?",
                "3. Do you make time to spend with the people you care about?",
                "4. Do you make compromises for your family and friends (willingly)?",
                "5. Do you generally have a strong sense of commitment in your relationships?",
                "6. Do you consider yourself a strong communicator? Communication is key in relationships.",
                "7. Do you forgive easily?",
                "8. Do you always make an effort to look good for your partner/date/person you're seeing/person you like?",
                "9. Do you keep things fresh in your relationship(s) and friendships?",
                "10. Regarding your partner/date/person you're seeing/person you like; do you always consider their interests?",
                "11. Do you put your family first in everything?",
                "12. Are you generous, not necessarily with money but with your time and effort in your relationships and with family?",
                "13. Do you care about yourself enough to get out of unhealthy relationships?",
                "14. Do you value yourself and what you have to offer in a relationship?",
                "15. Do you constantly try to bring joy into your relationships as opposed to conflict?",
                "16. Do you actually and genuinely want a happy life and are you willing to put in the work to have it?"
            ]))
        
    }
}
