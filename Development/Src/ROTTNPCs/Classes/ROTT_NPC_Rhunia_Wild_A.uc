/*=============================================================================
 * NPC - Rhunia Wilderness (A)
 *
 * Author: Otay
 * Bramble Gate Studios (All rights reserved)
 *
 * A wilderness NPC in Rhunia.
 *===========================================================================*/

class ROTT_NPC_Rhunia_Wild_A extends ROTT_NPC_Container;

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
  `NEW_NODE(GREETING, NUETRAL)
    "This rancid dreamscape ripped through reality",
    "when nine forbidden texts began circulating the realm."
  `ENDNODE
  
  `NEW_NODE(GREETING, NUETRAL)
    "We watched our fantasies become realities.",
    ""
  `ENDNODE
  
  `NEW_NODE(GREETING, NUETRAL)
    "Fantasy is a part of reality, because",
    "illusion exists in reality."
  `ENDNODE
  
  `NEW_NODE(GREETING, NUETRAL)
    "If illusion itself were an illusion, then",
    "everything would be reality."
  `ENDNODE
  
  `NEW_NODE(GREETING, NUETRAL)
    "In this surreal nightmare under the fallen kingdoms,",
    "we sleep only in death, and dream only in delusions."
  `ENDNODE
  
  `NEW_NODE(GREETING, NUETRAL)
    "We are the waste of fantasy.",
    ""
  `ENDNODE
  
  // ----------------------------------------------------------------------- //
  
  setInquiry(
    "Goodnight",
    "",
    "",
    "",
    
    BEHAVIOR_GOODBYE,
    BEHAVIOR_NONE,
    BEHAVIOR_NONE,
    BEHAVIOR_NONE
  );
  
}

/*=============================================================================
 * Default properties
 *===========================================================================*/
defaultProperties
{
  // NPC identity
  npcName=GENERIC
  
  // Background
  begin object class=UI_Texture_Info Name=NPC_Background_Texture
    componentTextures.add(Texture2D'GUI_NPC_Dialog.NPC_Background_Red')
  end object
  
  // Sprite container for transfer
  begin object class=UI_Texture_Storage Name=NPC_Background
    tag="NPC_Background"
    images(0)=NPC_Background_Texture
  end object
  npcBackground=NPC_Background
  
  // NPC Texture
  begin object class=UI_Texture_Info Name=NPC_Red_Gatekeeper
    componentTextures.add(Texture2D'Monsters.Enemy_Portrait_Cyclops_Red_Black_360')
  end object
  
  // Sprite container for transfer
  begin object class=UI_Texture_Storage Name=NPC_Sprites
    tag="NPC_Sprites"
    images(0)=NPC_Red_Gatekeeper
  end object
  npcSprites=NPC_Sprites
}





