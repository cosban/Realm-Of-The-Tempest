/*=============================================================================
 * NPC - Tannim Dialog
 *
 * Author: Otay
 * Bramble Gate Studios (All rights reserved)
 *
 * Tannim is a dragon tamer in Talonovia.  He's arrogant and values power.
 * The player is supposed to be able to battle his beasts and dragons,
 * (eventually.)
 *===========================================================================*/

class ROTT_NPC_Talonovia_Tannim extends ROTT_NPC_Container;

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
    "Tannim the dragon tamer is dangling a smoking thurible",
    "over a pet gargoyle. . ."
  `ENDNODE
  setColor(DEFAULT_MEDIUM_GOLD);
  
  `NEW_NODE(INTRODUCTION, NUETRAL)
    "Keeper of beasts and demons,",
    "Tannim, at your service."
  `ENDNODE
  
  `NEW_NODE(INTRODUCTION, NUETRAL)
    "You aren't here about the obelisk are you?",
    ""
  `ENDNODE
  
  `NEW_NODE(INTRODUCTION, NUETRAL)
    "Ever since \"the black magic tragedy\", the Talonovian high council",
    "has been in all sorts of disagreements."
  `ENDNODE
  
  `NEW_NODE(INTRODUCTION, NUETRAL)
    "Just don't.  Leave Rhunia's obelisk alone.",
    ""
  `ENDNODE
  
  // ----------------------------------------------------------------------- //
  
  `NEW_NODE(GREETING, NUETRAL)
    "You are safe here, friend.",
    ""
  `ENDNODE
  
    `ADD_OPTIONS(GREETING, NUETRAL)
      "Bestiary",
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
    "The howl of the tower wards away the damned,",
    "the unclean, and the monsters of the realm."
  `ENDNODE
  
  `NEW_NODE(INQUERY_OBELISK, NUETRAL)
    "It shakes tremors through their bones, the same",
    "way fear tremors through our hearts and hands."
  `ENDNODE
  
  `NEW_NODE(INQUERY_OBELISK, NUETRAL)
    "Taming demons and beasts is my purpose here.",
    ""
  `ENDNODE
  
  `NEW_NODE(INQUERY_OBELISK, NUETRAL)
    "The howling of an obelisk ward is no help to me.",
    ""
  `ENDNODE
  
  // ----------------------------------------------------------------------- //
  
  `NEW_NODE(INQUERY_TOMB, NUETRAL)
    "The backbone of strength is training.",
    ""
  `ENDNODE
  
  `NEW_NODE(INQUERY_TOMB, NUETRAL)
    "So champions of light come to me, to practice combat",
    "against undead beasts and demons."
  `ENDNODE
  
  `NEW_NODE(INQUERY_TOMB, NUETRAL)
    "It is a daunting duty, to heal the wounds",
    "of these monstrous giants after each skirmish."
  `ENDNODE
  
  `NEW_NODE(INQUERY_TOMB, NUETRAL)
    "However, the tomb of the Haxlyn priestess is host to",
    "a blossom imbued with restorative magick."
  `ENDNODE
  
  `NEW_NODE(INQUERY_TOMB, NUETRAL)
    "Regenerating the beasts with the blossoms from the tomb",
    "will help us find strength against them."
  `ENDNODE
  
  // ----------------------------------------------------------------------- //
  
  `NEW_NODE(INQUERY_GOLEM, NUETRAL)
    "When we fail to fathom the size of a beast,",
    "that is when facing it rewards us most."
  `ENDNODE
  
  `NEW_NODE(INQUERY_GOLEM, NUETRAL)
    "I will not die under the chains of cowardice,",
    "and neither should you, friend."
  `ENDNODE
  
  `NEW_NODE(INQUERY_GOLEM, NUETRAL)
    "Wake the golems, and they will wake you too.",
    ""
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
  npcName=TANNIM
  
  // Quest preferences
  preferences(OBELISK_ACTIVATION) = INACTION
  preferences(VALOR_BLOSSOMS)     = ACTION
  preferences(GOLEMS_BREATH)      = ACTION
  
  // Background
  begin object class=UI_Texture_Info Name=NPC_Background_Orange
    componentTextures.add(Texture2D'GUI_NPC_Dialog.NPC_Background_Orange'
  end object
  
  // Sprite container for transfer
  begin object class=UI_Texture_Storage Name=NPC_Background
    tag="NPC_Background"
    images(0)=NPC_Background_Orange
  end object
  npcBackground=NPC_Background
  
  // NPC Texture
  begin object class=UI_Texture_Info Name=NPC_Tannim
    componentTextures.add(Texture2D'NPCs.Tamers.NPC_Portrait_Tamer_Orange_360')
  end object
  
  // Sprite container for transfer
  begin object class=UI_Texture_Storage Name=NPC_Sprites
    tag="NPC_Sprites"
    images(0)=NPC_Tannim
  end object
  npcSprites=NPC_Sprites
}




























/**

/=============================================================================
 * NPC - Tannim Dialog
 *
 * Author: Otay
 * Bramble Gate Studios (All rights reserved)
 *
 * Tannim is a dragon tamer in Talonovia.  He's arrogant and values power.
 * The player is supposed to be able to battle his beasts and dragons,
 * (eventually.)
 *===========================================================================/

class ROTT_NPC_Talonovia_Tannim extends ROTT_NPC_Container;

function initdialogue() {
  local int length;               // Used to access a recently added node
  local ReplyNode newReplyNode;   // Used to prepare a reply node
  NPCMoodDialogueNode.Length = 5;
  
  
  / 1 - Love, 2 - Hate, 3 - Used to love, 4 - Used to hate, 
  //Love
  NPCMoodDialogueNode[1].MoodNode.AddItem(makeDialogNode(
  "You and your party are most welcome here %C!",
  "How may I help you?");
  
  NPCMoodDialogueNode[1].MoodNode.AddItem(makeDialogNode(
  "",
  "");
  
  //Hate
  NPCMoodDialogueNode[2].MoodNode.AddItem(makeDialogNode(
  "I am disturbed by your deeds.");
  NPCMoodDialogueNode[2].MoodNode.AddItem(makeDialogNode(
  "You are more foul than any creature I keep.");
  
  NPCMoodDialogueNode[2].MoodNode.AddItem(makeDialogNode(
  "");
  NPCMoodDialogueNode[2].MoodNode.AddItem(makeDialogNode(
  "");
  
  //Used to Love
  NPCMoodDialogueNode[3].MoodNode.AddItem(makeDialogNode(
  "Good to see you, champion.");
  NPCMoodDialogueNode[3].MoodNode.AddItem(makeDialogNode(
  "How may I help you?");
  
  NPCMoodDialogueNode[3].MoodNode.AddItem(makeDialogNode(
  "");
  NPCMoodDialogueNode[3].MoodNode.AddItem(makeDialogNode(
  "");
  
  //Used to Hate
  NPCMoodDialogueNode[4].MoodNode.AddItem(makeDialogNode(
  "Hello, welcome.");
  NPCMoodDialogueNode[4].MoodNode.AddItem(makeDialogNode(
  "");
  
  NPCMoodDialogueNode[4].MoodNode.AddItem(makeDialogNode(
  "");
  NPCMoodDialogueNode[4].MoodNode.AddItem(makeDialogNode(
  "");
  
  //Neutral
  NPCMoodDialogueNode[0].MoodNode.AddItem(makeDialogNode(
  "Welcome.");
  NPCMoodDialogueNode[0].MoodNode.AddItem(makeDialogNode(
  "");
  
  NPCMoodDialogueNode[0].MoodNode.AddItem(makeDialogNode(
  "");
  NPCMoodDialogueNode[0].MoodNode.AddItem(makeDialogNode(
  "");
  /
  
  //Intro
  eventResponses[INTRODUCTION].PosGreetNode.AddItem(makeDialogNode(
  "I am the dragon tamer, Tannim.",
  "Greetings %C."));
  
  eventResponses[INTRODUCTION].PosGreetNode.AddItem(makeDialogNode(
  "I soothe the blood of my monsters, just as the winds here",
  "in the harbor of Talonovia have been quieted by ancient magicks."));
  
  eventResponses[INTRODUCTION].PosGreetNode.AddItem(makeDialogNode(
  "The portals here provide passage all across the realm.",
  ""));
  
  eventResponses[INTRODUCTION].PosGreetNode.AddItem(makeDialogNode(
  "If you enter Rhunia's portal and come across an obelisk",
  "towering in a harsh sky, I must ask you not to disturb it."));
  
  
  
  
  / The Obelisk Conflict /
  / Positive /
  eventResponses[OBELISK_ACTIVATION].PosGreetNode.AddItem(makeDialogNode(
  "I see you have fought the evil dwelling in the dark halls of Rhunia,",
  "and returned without summoning the obelisk's curse."));
  
  eventResponses[OBELISK_ACTIVATION].PosGreetNode.AddItem(makeDialogNode(
  "Thank you friend, I'm happy to know the howl of the obelisk",
  "wont be harassing my monsters."));
  
  //eventResponses[OBELISK_ACTIVATION].PosGreetNode.AddItem(makeDialogNode(
  //"Will you then be moving onward to Etzland?",
  //"If so, best of luck brave my friend."));
  
  / Negative /
  eventResponses[OBELISK_ACTIVATION].NegGreetNode.AddItem(makeDialogNode(
  "You've made a poor choice, %C.  The creatures that I",
  "keep are greatly disturbed by the deep murmurs of the obelisk."));
  
  eventResponses[OBELISK_ACTIVATION].NegGreetNode.AddItem(makeDialogNode(
  "The threats you face merely crawl compared to the roar of my beasts.",
  ""));
  
  
  / The 2nd Hero /
  / Positive /
  eventResponses[ETZLAND_HERO].PosGreetNode.AddItem(makeDialogNode(
  "I see you have found the loyalty of a comrade.",
  ""));
  
  eventResponses[ETZLAND_HERO].PosGreetNode.AddItem(makeDialogNode(
  "Is this ally brave enough to spar with my dragons?",
  "Fearless enough to roar through the chambers of fallen citadels?"));
  
  eventResponses[ETZLAND_HERO].PosGreetNode.AddItem(makeDialogNode(
  "We'll see.",
  ""));
  
  eventResponses[ETZLAND_HERO].PosGreetNode.AddItem(makeDialogNode(
  "Many myths and legends allude to a fabled flower that can be",
  "found decorating The Tomb of a great hero in Haxlyn."));
  
  eventResponses[ETZLAND_HERO].PosGreetNode.AddItem(makeDialogNode(
  "If you are brave enough to seek The Tomb, then I may",
  "have a favor to ask of you."));
  
  / Negative /
  eventResponses[ETZLAND_HERO].NegGreetNode.AddItem(makeDialogNode(
  "Ahem. . . I hear you left the captive imprisoned in Etzland?",
  ""));
  
  eventResponses[ETZLAND_HERO].NegGreetNode.AddItem(makeDialogNode(
  "Even I am not so cruel to neglect my caged beasts and dragons",
  "from a fresh taste of freedom now and then."));
  
  eventResponses[ETZLAND_HERO].NegGreetNode.AddItem(makeDialogNode(
  "I would consider returning there if I were you.",
  ""));
  
  eventResponses[ETZLAND_HERO].NegGreetNode.AddItem(makeDialogNode(
  "Or, if you insist to press onward to Haxlyn, I have a favor",
  "to ask regarding The Tomb."));
  
  
  / The Tomb Conflict /
  / Positive /
  eventResponses[VALOR_BLOSSOMS].PosGreetNode.AddItem(makeDialogNode(
  "Haha! What a marvelous feat, my friend.  My dragons here",
  "smelled your blossoms the moment you arrived."));
  
  eventResponses[VALOR_BLOSSOMS].PosGreetNode.AddItem(makeDialogNode(
  "Thank you, %C.",
  ""));
  
  eventResponses[VALOR_BLOSSOMS].PosGreetNode.AddItem(makeDialogNode(
  "Your ambitions are impressive.  Is there no end to your",
  "momentum through the realm?",
    "I am unstoppable.",
    "Resting might be nice."
    ));
    
  newReplyNode.replyTop[0]    = "Ha!! Heroes deserve to boast.";
  newReplyNode.replyBottom[0] = "And you friend, are a hero.";
  
  newReplyNode.replyTop[1]    = "Ah, well.  All accomplished adventurers deserve their rest.";
  newReplyNode.replyBottom[1] = "Take your time, %C.";
  
  newReplyNode.replyTop[2]    = "";
  newReplyNode.replyBottom[2] = "";
  
  newReplyNode.replyTop[3]    = "";
  newReplyNode.replyBottom[3] = "";
  
  length = eventResponses[VALOR_BLOSSOMS].PosGreetNode.Length;
  eventResponses[VALOR_BLOSSOMS].PosGreetNode[length-1].optionReplies.addItem(newReplyNode);
 
 
  eventResponses[VALOR_BLOSSOMS].PosGreetNode.AddItem(makeDialogNode(
  "A portal to Valimor has manifested.  If and when you choose",
  "to venture through it, you may find an ominous golem shrine."));
  
  eventResponses[VALOR_BLOSSOMS].PosGreetNode.AddItem(makeDialogNode(
  "As usual, the Talonovian council is divided, and the",
  "decision of The Golem may soon rest in your hands."));
  
  
  / Negative /
  eventResponses[VALOR_BLOSSOMS].NegGreetNode.AddItem(makeDialogNode(
  "I had hoped to celebrate your arrival. . . I see now that I was",
  "foolish to hope you would return from The Tomb with the valor blossoms."));
  
  eventResponses[VALOR_BLOSSOMS].NegGreetNode.AddItem(makeDialogNode(
  "How very unfortunate.",
  "Now the skies seem dismal, and my dragons melancholy."));
  
  eventResponses[VALOR_BLOSSOMS].NegGreetNode.AddItem(makeDialogNode(
  "Only a coward would train with a melancholy dragon, %C.",
  ""));
  
  eventResponses[VALOR_BLOSSOMS].NegGreetNode.AddItem(makeDialogNode(
  "Ahem, well.  If you can survive the brutalities of Valimor,",
  "then you will find the shrine of The Golem."));
  
  eventResponses[VALOR_BLOSSOMS].NegGreetNode.AddItem(makeDialogNode(
  "Care to hear my opinion?",
  ""));
  
  
  / The Golem Conflict /
  / Positive /
  eventResponses[GOLEMS_BREATH].PosGreetNode.AddItem(makeDialogNode(
  "Eminent champion!  The Golem's breath invigorates the realm!",
  "You gave warmth to cold hearts."));
  
  eventResponses[GOLEMS_BREATH].PosGreetNode.AddItem(makeDialogNode(
  "Listen close and you can hear the blood rushing through",
  "the dragons. . . alert and ready to rival The Golem's mighty power."));
  
  / Negative /
  eventResponses[GOLEMS_BREATH].NegGreetNode.AddItem(makeDialogNode(
  "Oh, it's you. . .",
  "I don't need further grief from you now, %C."));
  
  eventResponses[GOLEMS_BREATH].NegGreetNode.AddItem(makeDialogNode(
  "Tell me, how can you survive such an impossible challenge as clearing the",
  "dungeons of Valimor and then ignore the magnificence of The Golem shrine?"));
  
  eventResponses[GOLEMS_BREATH].NegGreetNode.AddItem(makeDialogNode(
  "Could it be true that you, the seemingly fearless",
  "champion, now trembles in the face of true power?  Laughable."));
  
  / Inquiry /
  / The Obelisk /
  inqueryReplies[THE_OBELISK].inqueryNodes.AddItem(makeDialogNode(
  "The obelisk wards off monsters and dragons when activated,",
  "and that effect extends to the monsters and dragons in my possession."));
  
  inqueryReplies[THE_OBELISK].inqueryNodes.AddItem(makeDialogNode(
  "All my hard work capturing and taming these creatures will be",
  "for nothing because the obelisk will torture them."));
  
  inqueryReplies[THE_OBELISK].inqueryNodes.AddItem(makeDialogNode(
  "I may be forced to let them free to avoid uproar.",
  ""));
  
  inqueryReplies[THE_OBELISK].inqueryNodes.AddItem(makeDialogNode(
  "So you see, the obelisk must be inactive",
  "for me to continue my work."));
  
  / The Tomb /
  inqueryReplies[THE_TOMB].inqueryNodes.AddItem(makeDialogNode(
  "The legendary valor blossoms that grow at Haxlyn's tomb",
  "are most known for their restorative powers."));
  
  inqueryReplies[THE_TOMB].inqueryNodes.AddItem(makeDialogNode(
  "They could be used to restore the brave people who",
  "risk their lives to protect our harbor, but. . ."));
  
  inqueryReplies[THE_TOMB].inqueryNodes.AddItem(makeDialogNode(
  "I have a better idea.  Heal the people by conventional",
  "means, and let me heal my dragons with the valor blossoms."));
  
  inqueryReplies[THE_TOMB].inqueryNodes.AddItem(makeDialogNode(
  "Think about it %C, do not dismiss the idea too quickly.",
  "The more you can fight my dragons, the stronger you become."));
  
  inqueryReplies[THE_TOMB].inqueryNodes.AddItem(makeDialogNode(
  "You could soon be invincible through all that training, and I",
  "could save a fortune on restoration costs."));
  
  inqueryReplies[THE_TOMB].inqueryNodes.AddItem(makeDialogNode(
  "Return with the valor blossoms, %C.",
  ""));
  
  
  / The Golem /
  inqueryReplies[THE_GOLEM].inqueryNodes.AddItem(makeDialogNode(
  "You want to know where I stand on The Golem conflict?",
  "Take a wild guess my fearless friend."));
  
  inqueryReplies[THE_GOLEM].inqueryNodes.AddItem(makeDialogNode(
  "Truly devoted to my dragons, I am the master of monster taming. . .",
  "Am I not?"));
  
  inqueryReplies[THE_GOLEM].inqueryNodes.AddItem(makeDialogNode(
  "And The Golems, rulers of the ancient realm, have always been",
  "such intriguing enigmas to us all. . ."));
  
  inqueryReplies[THE_GOLEM].inqueryNodes.AddItem(makeDialogNode(
  "So how could I object to their revival?",
  ""));
  
  inqueryReplies[THE_GOLEM].inqueryNodes.AddItem(makeDialogNode(
  "Go, activate their shrine in Valimor.",
  "What could go wrong?"));
  
}


defaultProperties
{
  animTime=0.25
  
  eventPrefs(INTRODUCTION)       = NEUTRAL 
  eventPrefs(OBELISK_ACTIVATION) = DISABLED   // NO to Obelisk 
  eventPrefs(ETZLAND_HERO)       = ENABLED   // skipping the hero is shameful  
  eventPrefs(VALOR_BLOSSOMS)     = ENABLED    // YES to valor blossoms 
  eventPrefs(GOLEMS_BREATH)      = ENABLED    // YES to Golem 
  
  begin object class=GUITexturedrawInfo Name=NPC_Tannim_F1
    componentTextures.add(Texture2D'GUI.Tannim_Animation_F1'
  end object
  begin object class=GUITexturedrawInfo Name=NPC_Tannim_F2
    componentTextures.add(Texture2D'GUI.Tannim_Animation_F2'
  end object
  begin object class=GUITexturedrawInfo Name=NPC_Tannim_F3
    componentTextures.add(Texture2D'GUI.Tannim_Animation_F3'
  end object
  begin object class=GUITexturedrawInfo Name=NPC_Tannim_F4
    componentTextures.add(Texture2D'GUI.Tannim_Animation_F4'
  end object
  
  begin object class=GUISprite Name=NPC_Sprites
    tag="NPC_Sprites"
    PosX=464
    PosY=56
    PosXEnd=976
    PosYEnd=567    
    images(0)=None
    images(1)=NPC_Tannim_F1
    images(2)=NPC_Tannim_F2
    images(3)=NPC_Tannim_F1
    images(4)=NPC_Tannim_F2
    images(5)=NPC_Tannim_F1
    images(6)=NPC_Tannim_F3
    images(7)=NPC_Tannim_F4
    images(8)=NPC_Tannim_F3
    images(9)=NPC_Tannim_F4
    images(10)=NPC_Tannim_F3
  end object
  npcSprites=NPC_Sprites
  
  
  NPCMood=0
  FluxAnimationTempo=0
  
}











/        Obelisk, Tomb, Golem

  NPC           [1][2][3]  Big Reward
  Merchant      Y  N  Y    ???
  Prince        N  N  N    ???
  Medicine Man    Y  Y  N    
  Witch -        N  Y  N    ???
  Necromancer -    N  N  Y    
  Alchemist -      Y  Y  Y    ???
  Dragon Tamer -    N  Y  Y    
  
  Merchant wants obelisk ON for supply and demand of his products
  Prince wants obelisk OFF to prevent famine
  Librarian -
  Medicine man wants obelisk ON because it makes his job easier
  Witch wants obelisk the obelisk OFF because the radiation will disrupt her spells
  Necromancer wants obelisk 
  Alchemist wants the obelisk ON because the radiation will amplify his spells (lmao)
  Dragon tamer wants obelisk 
  
  Merchant wants tomb UNDISTURBED so he can sell his potions
  Prince wants tomb UNDISTURBED because he buried his sister there
  Librarian -
  Medicine man wants tomb TAKEN because it makes his job easier (even though he burried many of the people in the cemetary)
  Witch wants tomb TAKEN because she benefits from the cemetary being disturbed, she can harness disrupted astral energy
  Necromancer wants tomb 
  Alchemist wants tomb because he can use the tomb for potions
  Dragon tamer wants tomb 
  
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
/
















**/








































