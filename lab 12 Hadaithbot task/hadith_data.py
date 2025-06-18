# hadith_data.py

hadith_collection = {
    "prayer": "The Prophet ﷺ said: 'The closest a servant comes to his Lord is when he is prostrating.' (Sahih Muslim)",
    "fasting": "The Prophet ﷺ said: 'Whoever fasts during Ramadan with faith and seeking his reward from Allah will have his past sins forgiven.' (Bukhari & Muslim)",
    "charity": "The Prophet ﷺ said: 'Charity does not decrease wealth.' (Muslim)",
    "kindness": "The Prophet ﷺ said: 'Allah is kind and loves kindness in all matters.' (Bukhari)"
}

def get_hadith_response(user_input):
    user_input = user_input.lower()
    for topic, hadith in hadith_collection.items():
        if topic in user_input:
            return hadith
    return "Sorry, I couldn't find a relevant Hadith. Try asking about prayer, fasting, charity, or kindness."
