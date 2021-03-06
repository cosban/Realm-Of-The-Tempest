/*=============================================================================
 * ROTT_NPC_Talonovia_Salus
 *
 * Author: Otay
 * Bramble Gate Studios (All rights reserved)
 *
 * Salus is the town healer of Talonovia.
 *===========================================================================*/
 
class ROTT_NPC_Talonovia_Salus extends ROTT_NPC_Container;

// Macros for formatting dialog content
`DEFINE NEW_NODE(TOPIC, MODE)           addDialogNode(`TOPIC, `MODE, 
`DEFINE ADD_OPTIONS(TOPIC, MODE)        addOptions(`TOPIC, `MODE, 
`DEFINE ADD_REPLY(TOPIC, MODE, INDEX)   addReplyChain(`TOPIC, `MODE, `INDEX,

`DEFINE ENDNODE );

/*=============================================================================
 * initDialogue()
 * 
 * This sets all the dialog content
 *===========================================================================*/
public function initDialogue() {
  super.initDialogue();
  
  // Intro
  `NEW_NODE(INTRODUCTION, NUETRAL)
    "Salus the Cleric is tinkering with some flasks. . .",
    ""
  `ENDNODE
  setColor(DEFAULT_MEDIUM_GOLD);
  
  `NEW_NODE(INTRODUCTION, NUETRAL)
    "Welcome to Talonovia.",
    ""
  `ENDNODE
  
  `NEW_NODE(INTRODUCTION, NUETRAL)
    "I don't mean to disturb you, traveler,",
    "but I saw you arrive from the portals."
  `ENDNODE
  
  `NEW_NODE(INTRODUCTION, NUETRAL)
    "Why are you here?",
    ""
  `ENDNODE
  
    `ADD_OPTIONS(INTRODUCTION, NUETRAL)
      "Here to help.",
      "For the fight against evil.",
      "I don't know.",
      "None of your business, \"Salus.\""
    `ENDNODE
    
      `ADD_REPLY(INTRODUCTION, NUETRAL, 0)
        "What great news, your help is welcome here.",
        ""
      `ENDNODE
    
      `ADD_REPLY(INTRODUCTION, NUETRAL, 1)
        "Combat is common here, you will not be disappointed.",
        ""
      `ENDNODE
    
      `ADD_REPLY(INTRODUCTION, NUETRAL, 2)
        "Searching for your purpose then, huh?",
        ""
      `ENDNODE
    
      `ADD_REPLY(INTRODUCTION, NUETRAL, 3)
        "As a cleric, my business is with the well-being of my people.",
        "Our lives are in danger, including yours. . . bitter outlander."
      `ENDNODE
    
  `NEW_NODE(INTRODUCTION, NUETRAL)
    "Your time would be well spent in Rhunia,",
    "where one of our portals is tethered to."
  `ENDNODE
  
  `NEW_NODE(INTRODUCTION, NUETRAL)
    "If you can reach it, there is an obelisk in the citadel.",
    ""
  `ENDNODE
  
  `NEW_NODE(INTRODUCTION, NUETRAL)
    "I advise you to read the obelisk's prayers, %n. . .",
    "For summoning a protective barrier over the town."
  `ENDNODE
  
  // ----------------------------------------------------------------------- //
  
  `NEW_NODE(GREETING, NUETRAL)
    "May the storm bless and keep you, traveler.",
    ""
  `ENDNODE
  
    `ADD_OPTIONS(GREETING, NUETRAL)
      "Blessing",
      "Inquiry",
      "",
      "",
      
      BEHAVIOR_LAUNCH_SERVICE,
      BEHAVIOR_NONE
    `ENDNODE
    
      `ADD_REPLY(GREETING, NUETRAL, 0)
        "(Service unavailable in this version)",
        ""
      `ENDNODE
    
  // ----------------------------------------------------------------------- //
  
  `NEW_NODE(INQUERY_OBELISK, NUETRAL)
    "Once we pray again, at the shrine of the obelisk. . .",
    "a powerful spiritual pressure emenates from it."
  `ENDNODE
  
  `NEW_NODE(INQUERY_OBELISK, NUETRAL)
    "This pressure protects us, but slows the",
    "production of food, and the energy of life."
  `ENDNODE
  
  `NEW_NODE(INQUERY_OBELISK, NUETRAL)
    "Our ancestors learned to accept this comprimise,",
    "after their dangerous haste became their undoing."
  `ENDNODE
  
  `NEW_NODE(INQUERY_OBELISK, NUETRAL)
    "As the fifth scripture of the Agony Schema states,",
    ""
  `ENDNODE
  
  `NEW_NODE(INQUERY_OBELISK, NUETRAL)
    "\"The many hungers of our bodies and minds must each find",
    "their own proper pace between being fed, and being tamed.\""
  `ENDNODE
  
  `NEW_NODE(INQUERY_OBELISK, NUETRAL)
    "So ignite your prayers at the Obelisk, and",
    "join us together in patience and protection."
  `ENDNODE
  
  // ----------------------------------------------------------------------- //
  
  `NEW_NODE(INQUERY_TOMB, NUETRAL)
    "The Haxlyn Priestess wrote the holy scriptures of",
    "the Half Moon Memoirs before her execution."
  `ENDNODE
  
  `NEW_NODE(INQUERY_TOMB, NUETRAL)
    "Now, her rejuvinating spirit circulates through a",
    "collection of blossoms around her tomb."
  `ENDNODE
  
  `NEW_NODE(INQUERY_TOMB, NUETRAL)
    "Through magic rituals, she studied finality, composed with suffering,",
    "and forever changed how the world perceives mystery, and sacrifice."
  `ENDNODE
  
  `NEW_NODE(INQUERY_TOMB, NUETRAL)
    "If our spirits sacrificed knowledge to take our physical form,",
    "then mystery and sacrifice are intrinsic to our souls."
  `ENDNODE
  
  `NEW_NODE(INQUERY_TOMB, NUETRAL)
    "So based on her relationship to sacrifice, don't you think she'd",
    "want the blossoms to be collected from her holy burial site?"
  `ENDNODE
  
  // ----------------------------------------------------------------------- //
  
  `NEW_NODE(INQUERY_GOLEM, NUETRAL)
    "The golems may be dangerous, %n.",
    ""
  `ENDNODE
  
  `NEW_NODE(INQUERY_GOLEM, NUETRAL)
    "My faith belongs to my scriptures,",
    "not to wishful rumors of ancient mysteries."
  `ENDNODE
  
  `NEW_NODE(INQUERY_GOLEM, NUETRAL)
    "I believe they were frozen to protect us,",
    "and it should remain that way."
  `ENDNODE
  
  // ----------------------------------------------------------------------- //
  
  setInquiry(
    "Ask about the obelisk",
    "Ask about the tomb",
    "Ask about the golem",
    "Goodnight",
    
    BEHAVIOR_INQUERY_OBELISK,
    BEHAVIOR_INQUERY_TOMB,
    BEHAVIOR_INQUERY_GOLEM,
    BEHAVIOR_GOODBYE
  );
  
}

/*=============================================================================
 * Default properties
 *===========================================================================*/
defaultProperties
{
  // NPC identity
  npcName=SALUS
  serviceType=SERVICE_BLESSINGS
  
  // Quest preferences
  preferences(OBELISK_ACTIVATION) = ACTION
  preferences(VALOR_BLOSSOMS)     = ACTION
  preferences(GOLEMS_BREATH)      = INACTION
  
  // Background
  begin object class=UI_Texture_Info Name=NPC_Background_Tan_Blue
    componentTextures.add(Texture2D'GUI_NPC_Dialog.NPC_Background_Tan_Blue'
  end object
  
  // Sprite container for transfer
  begin object class=UI_Texture_Storage Name=NPC_Background
    tag="NPC_Background"
    images(0)=NPC_Background_Tan_Blue
  end object
  npcBackground=NPC_Background
  
  // NPC Texture
  begin object class=UI_Texture_Info Name=NPC_Salus
    componentTextures.add(Texture2D'NPCs.Clerics.NPC_Portrait_Cleric_Blue_360')
  end object
  
  // Sprite container for transfer
  begin object class=UI_Texture_Storage Name=NPC_Sprites
    tag="NPC_Sprites"
    images(0)=NPC_Salus
  end object
  npcSprites=NPC_Sprites
}





  /**
  begin object class=UI_Texture_Info Name=NPC_Background_Blue
    componentTextures.add(Texture2D'GUI_NPC_Dialog.NPC_Background_Blue'
  end object
  begin object class=UI_Texture_Info Name=NPC_Background_Dark_Gray
    componentTextures.add(Texture2D'GUI_NPC_Dialog.NPC_Background_Dark_Gray'
  end object
  begin object class=UI_Texture_Info Name=NPC_Background_Dark_Tan
    componentTextures.add(Texture2D'GUI_NPC_Dialog.NPC_Background_Dark_Tan'
  end object
  begin object class=UI_Texture_Info Name=NPC_Background_Green
    componentTextures.add(Texture2D'GUI_NPC_Dialog.NPC_Background_Green'
  end object
  begin object class=UI_Texture_Info Name=NPC_Background_Orange
    componentTextures.add(Texture2D'GUI_NPC_Dialog.NPC_Background_Orange'
  end object
  begin object class=UI_Texture_Info Name=NPC_Background_Red
    componentTextures.add(Texture2D'GUI_NPC_Dialog.NPC_Background_Red'
  end object
  begin object class=UI_Texture_Info Name=NPC_Background_Tan_Blue
    componentTextures.add(Texture2D'GUI_NPC_Dialog.NPC_Background_Tan_Blue'
  end object
  begin object class=UI_Texture_Info Name=NPC_Background_Violet
    componentTextures.add(Texture2D'GUI_NPC_Dialog.NPC_Background_Violet'
  end object
  **/



























/**
class ROTT_NPC_Talonovia_Salus extends ROTT_NPC_Container;

function initdialogue() {
  local int length;             // Used to access a recently added node
  local ReplyNode newReplyNode; // Used to prepare a reply node
  
  NPCMoodDialogueNode.Length = 5;
  
  / 1 - Love, 2 - Hate, 3 - Used to love, 4 - Used to hate, 
  //Love
  NPCMoodDialogueNode[1].MoodNode.AddItem(makeDialogNode("Brave hero! You honor me with your presence.");
  NPCMoodDialogueNode[1].MoodNode.AddItem(makeDialogNode("What do you need?");
  
  NPCMoodDialogueNode[1].MoodNode.AddItem(makeDialogNode("");
  NPCMoodDialogueNode[1].MoodNode.AddItem(makeDialogNode("");
  
  //Hate
  NPCMoodDialogueNode[2].MoodNode.AddItem(makeDialogNode("It takes great patience to put up with");
  NPCMoodDialogueNode[2].MoodNode.AddItem(makeDialogNode("your defiance, adventurer.");
  
  NPCMoodDialogueNode[2].MoodNode.AddItem(makeDialogNode("");
  NPCMoodDialogueNode[2].MoodNode.AddItem(makeDialogNode("");
  
  //Used to Love
  NPCMoodDialogueNode[3].MoodNode.AddItem(makeDialogNode("I still have great respect for you, hero.");
  NPCMoodDialogueNode[3].MoodNode.AddItem(makeDialogNode("How may I help you?");
  
  NPCMoodDialogueNode[3].MoodNode.AddItem(makeDialogNode("");
  NPCMoodDialogueNode[3].MoodNode.AddItem(makeDialogNode("");
  
  //Used to Hate
  NPCMoodDialogueNode[4].MoodNode.AddItem(makeDialogNode("Welcome.");
  NPCMoodDialogueNode[4].MoodNode.AddItem(makeDialogNode("");
  
  NPCMoodDialogueNode[4].MoodNode.AddItem(makeDialogNode("");
  NPCMoodDialogueNode[4].MoodNode.AddItem(makeDialogNode("");
  
  //Neutral
  NPCMoodDialogueNode[0].MoodNode.AddItem(makeDialogNode("Greetings.");
  NPCMoodDialogueNode[0].MoodNode.AddItem(makeDialogNode("");
  
  NPCMoodDialogueNode[0].MoodNode.AddItem(makeDialogNode("");
  NPCMoodDialogueNode[0].MoodNode.AddItem(makeDialogNode("");
  /
  
  / 0 - Intro, 1 - Conflict, 2 - none, 3 - Conflict, 4 - Conflict, 5 - none/
  //Intro
  eventResponses[INTRODUCTION].PosGreetNode.AddItem(makeDialogNode(
  "Greetings.  I am Salus, the town Healer.",
  "I watched you arrive from the portals."));
  
  eventResponses[INTRODUCTION].PosGreetNode.AddItem(makeDialogNode(
  "Do you know why you are here?",
  "",
    "I'm here to help.",
    "I'm here to fight evil.",
    "I honestly don't know.",
    "None of your business, ''Salus.''"));
  
  newReplyNode.replyTop[0]    = "Ah, your help is indeed most welcome here.";
  newReplyNode.replyBottom[0] = "";
  
  newReplyNode.replyTop[1]    = "If you long for combat, you will not be disappointed.";
  newReplyNode.replyBottom[1] = "";
  
  newReplyNode.replyTop[2]    = "If it is purpose you seek, you will find it here.";
  newReplyNode.replyBottom[2] = "";
  
  newReplyNode.replyTop[3]    = "My business is with the well being of Talonovia's people, and";
  newReplyNode.replyBottom[3] = "our lives are in danger, including you. . . bitter %C.";
  
  length = eventResponses[INTRODUCTION].PosGreetNode.Length;
  eventResponses[INTRODUCTION].PosGreetNode[length-1].optionReplies.addItem(newReplyNode);
  
  
  eventResponses[INTRODUCTION].PosGreetNode.AddItem(makeDialogNode(
  "Your time now is best spent fighting monsters in",
  "Rhunia."));
  
  eventResponses[INTRODUCTION].PosGreetNode.AddItem(makeDialogNode(
  "And if you can reach it, there is an obelisk there.",
  "I advise you to turn it on, %C."));
  
  
  / The Obelisk Conflict /
  / Positive /
  eventResponses[OBELISK_ACTIVATION].PosGreetNode.AddItem(makeDialogNode(
  "Magnificent!  You have done it, %C!",
  ""));
  
  eventResponses[OBELISK_ACTIVATION].PosGreetNode.AddItem(makeDialogNode(
  "The power of the obelisk blesses Talonovia's harbors.",
  "Thank you."));
  
  eventResponses[OBELISK_ACTIVATION].PosGreetNode.AddItem(makeDialogNode(
  "As Talonovia's healer, added protection is",
  "always refreshing news."));
  
  eventResponses[OBELISK_ACTIVATION].PosGreetNode.AddItem(makeDialogNode(
  "Your great quest must continue now, adventurer.  The portal",
  "to Etzland has now been materialized."));
  
  eventResponses[OBELISK_ACTIVATION].PosGreetNode.AddItem(makeDialogNode(
  "In Etzland you will find a prison.  Legends say this prison",
  "holds a great adventurer."));
  
  eventResponses[OBELISK_ACTIVATION].PosGreetNode.AddItem(makeDialogNode(
  "I believe those legends.  During my meditations, I have sensed",
  "them to be true, there is heroic power out there. . ."));
  
  eventResponses[OBELISK_ACTIVATION].PosGreetNode.AddItem(makeDialogNode(
  "But I feel it fading. . . you must be quick.",
  "Hurry now, to Etzland!"));
  
  / Negative /
  eventResponses[OBELISK_ACTIVATION].NegGreetNode.AddItem(makeDialogNode(
  "It was a great mistake to neglect the power",
  "of the obelisk, %C."));
  
  eventResponses[OBELISK_ACTIVATION].NegGreetNode.AddItem(makeDialogNode(
  "You have underestimated our supply reserves and overestimated",
  "our strength against the dark forces."));
  
  eventResponses[OBELISK_ACTIVATION].NegGreetNode.AddItem(makeDialogNode(
  "Next time you return to Rhunia, I hope you reconsider.",
  "But there is still some good that has come of your bravery."));
  
  eventResponses[OBELISK_ACTIVATION].NegGreetNode.AddItem(makeDialogNode(
  "Your quest has secured passage to Etzland.",
  "A new portal has materialized!"));
  
  eventResponses[OBELISK_ACTIVATION].NegGreetNode.AddItem(makeDialogNode(
  "In Etzland you will find a prison.  Legends say this prison",
  "holds a great adventurer."));
  
  eventResponses[OBELISK_ACTIVATION].NegGreetNode.AddItem(makeDialogNode(
  "I believe those legends.  During my meditations, I have sensed",
  "them to be true, there is heroic power out there. . ."));
  
  eventResponses[OBELISK_ACTIVATION].NegGreetNode.AddItem(makeDialogNode(
  "But I feel it fading. . . you must be quick.",
  "Hurry now, to Etzland!"));
  
  
  / The 2nd Hero /
  / Positive /
  eventResponses[ETZLAND_HERO].PosGreetNode.AddItem(makeDialogNode(
  "I see you found the prisoner the legends spoke of?",
  "Congratulations, friend."));
  
  eventResponses[ETZLAND_HERO].PosGreetNode.AddItem(makeDialogNode(
  "You will both surely become great heroes. . .",
  "Oh, did you hear?  The portal to Haxlyn has taken shape."));
  
  eventResponses[ETZLAND_HERO].PosGreetNode.AddItem(makeDialogNode(
  "The monsters of Haxlyn are strong, you must",
  "be careful as you proceed!"));
  
  eventResponses[ETZLAND_HERO].PosGreetNode.AddItem(makeDialogNode(
  "Before his death. . . my master, the grand healer, had",
  "once told me the story of an ancient hero."));
  
  eventResponses[ETZLAND_HERO].PosGreetNode.AddItem(makeDialogNode(
  "Thousands of years ago, this great hero was killed,",
  "and he was buried in Haxlyn."));
  
  eventResponses[ETZLAND_HERO].PosGreetNode.AddItem(makeDialogNode(
  "It was said that the power of the great hero's spirit is still",
  "there in Haxlyn, breathing life into that toxic dungeon."));
  
  eventResponses[ETZLAND_HERO].PosGreetNode.AddItem(makeDialogNode(
  "If you find this hero's tomb, and the stories are true,",
  "you will see Valor Blossoms growing around the burial site."));
  
  eventResponses[ETZLAND_HERO].PosGreetNode.AddItem(makeDialogNode(
  "You must collect the Valor Blossoms!",
  "Bring them here to Talonovia to harness their healing power!"));
  
  / Negative /
  eventResponses[ETZLAND_HERO].NegGreetNode.AddItem(makeDialogNode(
  "You left the lost adventurer stranded in Etzland?",
  "Are you not going to go back and rescue them?"));
  
  eventResponses[ETZLAND_HERO].NegGreetNode.AddItem(makeDialogNode(
  "Well nevermind that for now, I must tell you the news.",
  "The portal to Haxlyn has taken shape."));
  
  eventResponses[ETZLAND_HERO].NegGreetNode.AddItem(makeDialogNode(
  "The monsters of Haxlyn are strong, you must",
  "be careful as you proceed!"));
  
  eventResponses[ETZLAND_HERO].NegGreetNode.AddItem(makeDialogNode(
  "Before his death. . . my master, the grand healer, had",
  "once told me the story of an ancient hero."));
  
  eventResponses[ETZLAND_HERO].NegGreetNode.AddItem(makeDialogNode(
  "Thousands of years ago, this great hero was killed,",
  "and he was buried in Haxlyn."));
  
  eventResponses[ETZLAND_HERO].NegGreetNode.AddItem(makeDialogNode(
  "It was said that the power of the great hero's spirit is still",
  "there in Haxlyn, breathing life into that toxic dungeon."));
  
  eventResponses[ETZLAND_HERO].NegGreetNode.AddItem(makeDialogNode(
  "If you find this hero's tomb, and the stories are true,",
  "you will see Valor Blossoms growing around the burial site."));
  
  eventResponses[ETZLAND_HERO].NegGreetNode.AddItem(makeDialogNode(
  "You must collect the Valor Blossoms!",
  "Bring them here to Talonovia to harness their healing power!"));
  
  / The Tomb Conflict /
  / Positive /
  eventResponses[VALOR_BLOSSOMS].PosGreetNode.AddItem(makeDialogNode(
  "Amazing. . . You retrieved the valor blossoms!",
  ""));
  
  eventResponses[VALOR_BLOSSOMS].PosGreetNode.AddItem(makeDialogNode(
  "Not only have you secured the health of the",
  "Talonovian people, but you have also unlocked Valimor."));
  
  eventResponses[VALOR_BLOSSOMS].PosGreetNode.AddItem(makeDialogNode(
  "Beware, Valimor is a dangerous and mysterious place.",
  "I'm sure you have noticed the Golem here in Talonovia?"));
  
  eventResponses[VALOR_BLOSSOMS].PosGreetNode.AddItem(makeDialogNode(
  "The golem has always been frozen, deactivated.",
  "No one knows why, but I believe I know how."));
  
  eventResponses[VALOR_BLOSSOMS].PosGreetNode.AddItem(makeDialogNode(
  "A shrine, hidden deep within Valimor, holds the",
  "control over all the golems of the realm."));
  
  eventResponses[VALOR_BLOSSOMS].PosGreetNode.AddItem(makeDialogNode(
  "That's right. . . there are more golems scattered",
  "throughout the web of portals across the universe."));
  
  eventResponses[VALOR_BLOSSOMS].PosGreetNode.AddItem(makeDialogNode(
  "Other than that, I have no information in my texts",
  "to explain the golems' purpose."));
  
  
  / Negative /
  eventResponses[VALOR_BLOSSOMS].NegGreetNode.AddItem(makeDialogNode(
  "You arrive empty handed from Haxlyn?",
  "I understand your decision."));
  
  eventResponses[VALOR_BLOSSOMS].NegGreetNode.AddItem(makeDialogNode(
  "It may be a hard choice to make, but next time",
  "you travel there, I hope you reconsider."));
  
  eventResponses[VALOR_BLOSSOMS].NegGreetNode.AddItem(makeDialogNode(
  "Well now, are you ready for your next",
  "challenge?  The gate to Valimor has opened."));
  
  eventResponses[VALOR_BLOSSOMS].NegGreetNode.AddItem(makeDialogNode(
  "Beware, Valimor is a dangerous and mysterious place.",
  "I'm sure you have noticed the Golem here in Talonovia?"));
  
  eventResponses[VALOR_BLOSSOMS].NegGreetNode.AddItem(makeDialogNode(
  "The golem has always been frozen, deactivated.",
  "No one knows why, but I believe I know how."));
  
  eventResponses[VALOR_BLOSSOMS].NegGreetNode.AddItem(makeDialogNode(
  "A shrine, hidden deep within Valimor, holds the",
  "control over all the golems of the realm."));
  
  eventResponses[VALOR_BLOSSOMS].NegGreetNode.AddItem(makeDialogNode(
  "That's right. . . there are more golems scattered",
  "throughout the web of portals across the universe."));
  
  eventResponses[VALOR_BLOSSOMS].NegGreetNode.AddItem(makeDialogNode(
  "I have no information in my texts to explain the golems'",
  "purpose.  So I must say leave them deactivated."));
  
  
  
  / The Golem Conflict /
  / Positive /
  eventResponses[GOLEMS_BREATH].PosGreetNode.AddItem(makeDialogNode(
  "I see you have returned from Valimor and that",
  "Talonovia's golem is disabled."));
  
  eventResponses[GOLEMS_BREATH].PosGreetNode.AddItem(makeDialogNode(
  "I think you have made a wise choice.",
  ""));
  
  / Negative /
  eventResponses[GOLEMS_BREATH].NegGreetNode.AddItem(makeDialogNode(
  "You have taken a great risk by activating the",
  "golem shrine in Valimor, adventurer."));
  
  eventResponses[GOLEMS_BREATH].NegGreetNode.AddItem(makeDialogNode(
  "The shrine breaths life in to all golems,",
  "including the one here in Talonovia."));
  
  eventResponses[GOLEMS_BREATH].NegGreetNode.AddItem(makeDialogNode(
  "Let's just hope this mysterious golem",
  "has no evil intentions."));
  
  
  //The Dominus Demise
  //eventResponses[5].PosGreetNode.AddItem(makeDialogNode("You completed the last quest?"));
  //eventResponses[5].PosGreetNode.AddItem(makeDialogNode("Cool."));
  
  
  / Inquiry /
  / The Obelisk /
  inqueryReplies[THE_OBELISK].inqueryNodes.AddItem(makeDialogNode(
  "Activating the obelisk will grant all of",
  "Talonovia a powerful protection."));
  
  inqueryReplies[THE_OBELISK].inqueryNodes.AddItem(makeDialogNode(
  "Trust me, as the town healer.",
  "We need that protection."));
  
  inqueryReplies[THE_OBELISK].inqueryNodes.AddItem(makeDialogNode(
  "There may be a side effect that causes",
  "the destruction of some of our food sources. . ."));
  
  inqueryReplies[THE_OBELISK].inqueryNodes.AddItem(makeDialogNode(
  "But it is easier to feed a hungry man food,",
  "than it is to feed a dying man medicine."));
  
  inqueryReplies[THE_OBELISK].inqueryNodes.AddItem(makeDialogNode(
  "Now find your way to Rhunia.",
  "The portal is at the center of town."));
  
  / The Tomb /
  inqueryReplies[THE_TOMB].inqueryNodes.AddItem(makeDialogNode(
  "A great hero is buried in Haxlyn,",
  "a place that was once holy ground, now flooded with demons."));
  
  inqueryReplies[THE_TOMB].inqueryNodes.AddItem(makeDialogNode(
  "A special blossom grows by the tomb of this great hero,",
  "it's called the valor blossom."));
    
    inqueryReplies[THE_TOMB].inqueryNodes.AddItem(makeDialogNode(
    "Gathering the blossoms for their restorative power",
    "could help us save lives."));
    
  inqueryReplies[THE_TOMB].inqueryNodes.AddItem(makeDialogNode(
  "Even though doing this may be seen as disrespectful,",
  "I strongly support it."));
    
    inqueryReplies[THE_TOMB].inqueryNodes.AddItem(makeDialogNode(
    "The best way to respect the dead is",
    "to stop others from joining them."));
    
  / The Golem /
  inqueryReplies[THE_GOLEM].inqueryNodes.AddItem(makeDialogNode(
  "The golem may be dangerous, %C.",
  "I don't trust the words of random rumors and legends."));
  
  inqueryReplies[THE_GOLEM].inqueryNodes.AddItem(makeDialogNode(
  "I believe the golem was frozen",
  "with good reason, and it should remain that way."));
  
}


defaultProperties
{
  animTime=0.25
  
  // Event preferences, used to determines how npc reply to player events 
  eventPrefs(INTRODUCTION)       = NEUTRAL 
  eventPrefs(OBELISK_ACTIVATION) = ENABLED    // YES to Obelisk 
  eventPrefs(ETZLAND_HERO)       = ENABLED    // skipping the hero is shameful 
  eventPrefs(VALOR_BLOSSOMS)     = ENABLED    // YES to valor blossoms 
  eventPrefs(GOLEMS_BREATH)      = DISABLED   // NO to Golem 
  
  begin object class=GUITexturedrawInfo Name=NPC_Salus_F1
    componentTextures.add(Texture2D'GUI.Salus_Animation_F1'
  end object
  begin object class=GUITexturedrawInfo Name=NPC_Salus_F2
    componentTextures.add(Texture2D'GUI.Salus_Animation_F2'
  end object
  begin object class=GUITexturedrawInfo Name=NPC_Salus_F3
    componentTextures.add(Texture2D'GUI.Salus_Animation_F3'
  end object
  
  // NPC Sprite rendering info
  begin object class=GUIVisualComponent Name=NPC_Sprites
    tag="NPC_Sprites"
    PosX=464
    PosY=56
    PosXEnd=976
    PosYEnd=567
    images(0)=None
    images(1)=NPC_Salus_F1
    images(2)=NPC_Salus_F2
    images(3)=NPC_Salus_F3
    images(4)=NPC_Salus_F2
  end object
  npcSprites=NPC_Sprites
  
  // extra junk
  NPCMood=0
  FluxAnimationTempo=0
  
  
}

*        Obelisk, Tomb, Golem

  NPC           [1][2][3]  Big Reward
  Merchant        Y  N  Y    ???
  Prince          N  N  N    ???
  Medicine Man    Y  Y  N    
  Witch -          N  Y  N    ???
  Necromancer -    N  N  Y    
  Alchemist -      Y  Y  Y    ???
  Dragon Tamer -  N  Y  Y    
  
  Librarian      -  -  -    
  
  Merchant wants obelisk ON for supply and demand of his products
  Prince wants obelisk OFF to prevent famine
  Librarian -
  Medicine man wants obelisk ON because it makes his job easier
  Witch wants obelisk the obelisk OFF because the radiation will disrupt her spells
  Necromancer wants obelisk ???
  Alchemist wants obelisk wants the obelisk ON because the radiation will amplify his spells (lmao)
  Dragon tamer wants obelisk off because it will disturb his monsters
  
  Merchant wants tomb UNDISTURBED so he can sell his potions
  Prince wants tomb UNDISTURBED because he buried his sister there
  Librarian -
  Medicine man wants tomb TAKEN because it makes his job easier (even though he burried many of the people in the cemetary)
  Witch wants tomb TAKEN because she benefits from the cemetary being disturbed, she can harness disrupted astral energy
  Necromancer wants tomb ???
  Alchemist wants tomb because he can use the tomb for potions
  Dragon tamer wants tomb ???
  
  Merchant wants golem 
  Prince wants golem 
  Librarian -
  Medicine man wants golem 
  Witch wants golem 
  Necromancer wants golem 
  Alchemist wants golem 
  Dragon tamer wants golem 
  
  Librarian:
  - Explains portals and monsters
  - Explains gas planet lore
  - Explains Dominus
  - Responds to each level's completion but not the conflict?
  
**/










