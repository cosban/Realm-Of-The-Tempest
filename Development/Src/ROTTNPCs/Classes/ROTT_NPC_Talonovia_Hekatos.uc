/*=============================================================================
 * NPC - Hekatos Dialog
 *
 * Author: Otay
 * Bramble Gate Studios (All rights reserved)
 *
 * Hekatos is a witch in Talonovia.  She's cyptic and eccentric. 
 * The player is supposed to be able to play some sort of minigame with her,
 * possibly potion crafting for permanent stat boosts, (eventually.)
 *===========================================================================*/

class ROTT_NPC_Talonovia_Hekatos extends ROTT_NPC_Container;

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
    "Hekatos the Witch is coughing over a haze of violet fumes. . .",
    ""
  `ENDNODE
  setColor(DEFAULT_MEDIUM_GOLD);
  
  `NEW_NODE(INTRODUCTION, NUETRAL)
    "Spirits whispered of your arrival to me.",
    ""
  `ENDNODE
  
  `NEW_NODE(INTRODUCTION, NUETRAL)
    "The wispy murmurs of spirits chatter,",
    "while the tempest screams to me."
  `ENDNODE
  
  `NEW_NODE(INTRODUCTION, NUETRAL)
    "For I am the master practitioner of chemical witchcraft,",
    "channeler of the high queen of the underworld. . ."
  `ENDNODE
  
  `NEW_NODE(INTRODUCTION, NUETRAL)
    "I am Hekatos.",
    ""
  `ENDNODE
  
  `NEW_NODE(INTRODUCTION, NUETRAL)
    "You hear them too, don't you?",
    "The spirits. . ."
  `ENDNODE
  
    `ADD_OPTIONS(INTRODUCTION, NUETRAL)
      "Sure",
      "Not really",
      "Are you mad or what?",
      ""
    `ENDNODE
    
      `ADD_REPLY(INTRODUCTION, NUETRAL, 0)
        "This curse is not too common. . .",
        "What a blessing I found you."
      `ENDNODE
    
      `ADD_REPLY(INTRODUCTION, NUETRAL, 1)
        "Have no fear.  I am here to relay you their secrets.",
        ""
      `ENDNODE
    
      `ADD_REPLY(INTRODUCTION, NUETRAL, 2)
        "Swallow your spit, coward.",
        "You cannot taunt me or the goddess we serve."
      `ENDNODE
    
      `ADD_REPLY(INTRODUCTION, NUETRAL, 2)
        "Madness is no weakness when the darkness",
        "deepens as it does here, in this realm."
      `ENDNODE
    
  `NEW_NODE(INTRODUCTION, NUETRAL)
    "There is terror in the dark,",
    "and the spirits know it."
  `ENDNODE
  
  `NEW_NODE(INTRODUCTION, NUETRAL)
    "They tell me your path will wind through the storms",
    "until you reach a citadel, and a tower."
  `ENDNODE
  
  `NEW_NODE(INTRODUCTION, NUETRAL)
    "It is the obelisk of Rhunia.",
    "When you reach it, abstain from its agitation."
  `ENDNODE
  
  // ----------------------------------------------------------------------- //
  
  `NEW_NODE(GREETING, NUETRAL)
    "I was told you would come.",
    ""
  `ENDNODE
  
    `ADD_OPTIONS(GREETING, NUETRAL)
      "Lottery",
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
    "The obelisk of Rhunia must not be disturbed.",
    ""
  `ENDNODE
  
  `NEW_NODE(INQUERY_OBELISK, NUETRAL)
    "The screech of that awful tower deafens my link",
    "to the spirit world."
  `ENDNODE
  
  ///`NEW_NODE(INQUERY_OBELISK, NUETRAL)
  ///  "The raging energy invested within it deafens my link",
  ///  "to the spirit world."
  ///`ENDNODE
  
  // ----------------------------------------------------------------------- //
  
  `NEW_NODE(INQUERY_TOMB, NUETRAL)
    "Yes, yes. . . The tomb.",
    "It is where the soul of the Haxlyn priestess rests."
  `ENDNODE
  
  `NEW_NODE(INQUERY_TOMB, NUETRAL)
    "I know her spirit well.",
    ""
  `ENDNODE
  
  `NEW_NODE(INQUERY_TOMB, NUETRAL)
    "She yearns to raise waves through the world as you do, %n.",
    "It is not in her nature to rest."
  `ENDNODE
  
  `NEW_NODE(INQUERY_TOMB, NUETRAL)
    "The essence of her will is carried through the blossoms",
    "that decorate her tomb."
  `ENDNODE
  
  `NEW_NODE(INQUERY_TOMB, NUETRAL)
    "To free her will upon the world,",
    "bring us back her botanical blessing."
  `ENDNODE
  
  // ----------------------------------------------------------------------- //
  
  `NEW_NODE(INQUERY_GOLEM, NUETRAL)
    "The ethereal hand of our moonlight cast itself upon",
    "a set of scrolls, writing what we call the Lunar Credo."
  `ENDNODE
  
  `NEW_NODE(INQUERY_GOLEM, NUETRAL)
    "Now banished, the text corrupts all who read it without sagacity.",
    "It burns holes in their minds."
  `ENDNODE
  
  `NEW_NODE(INQUERY_GOLEM, NUETRAL)
    "The high queen of the underworld sanctioned me to read three",
    "of its pages, in which the moonlight etched the golem's husk."
  `ENDNODE
  
  `NEW_NODE(INQUERY_GOLEM, NUETRAL)
    "From each esoteric passage, I learned only that mystery",
    "holds a thick cloak over our world."
  `ENDNODE
  
  `NEW_NODE(INQUERY_GOLEM, NUETRAL)
    "Do not meddle with their slumber, %n.",
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
  npcName=HEKATOS
  
  // Quest preferences
  preferences(OBELISK_ACTIVATION) = INACTION
  preferences(VALOR_BLOSSOMS)     = ACTION
  preferences(GOLEMS_BREATH)      = INACTION
  
  // Background
  begin object class=UI_Texture_Info Name=NPC_Background_Violet
    componentTextures.add(Texture2D'GUI_NPC_Dialog.NPC_Background_Violet'
  end object
  
  // Sprite container for transfer
  begin object class=UI_Texture_Storage Name=NPC_Background
    tag="NPC_Background"
    images(0)=NPC_Background_Violet
  end object
  npcBackground=NPC_Background
  
  // NPC Texture
  begin object class=UI_Texture_Info Name=NPC_Hekatos
    componentTextures.add(Texture2D'NPCs.Witches.NPC_Portrait_Witch_Purple_360')
  end object
  
  // Sprite container for transfer
  begin object class=UI_Texture_Storage Name=NPC_Sprites
    tag="NPC_Sprites"
    images(0)=NPC_Hekatos
  end object
  npcSprites=NPC_Sprites
}




























