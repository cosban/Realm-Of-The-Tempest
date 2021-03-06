/*=============================================================================
 * ROTT_Descriptor_Skill_Wizard_Arcane_Sigil
 *
 * Author: Otay
 * Bramble Gate Studios (All rights reserved)
 *
 * One of the wizards skill descriptors.
 *===========================================================================*/

class ROTT_Descriptor_Skill_Wizard_Arcane_Sigil extends ROTT_Descriptor_Hero_Skill;

/*=============================================================================
 * initialize()
 *
 * this function should be called by the descriptor container to set headers
 * and paragraph formatting info
 *===========================================================================*/
public function setUI() {
  // Set header
  h1(
    "Arcane Sigil"
  );
  
  // Set header
  h2(
    getHeader(targetingLabel)
  );
  
  // Set paragraph information
  p1(
    "When this hero uses the defend ability,",
    "all members of this team will deal more",
    "physical damage."
  );
  
  // Set skill information for p2 and p3
  skillInfo(
    "+%amp% Physical Damage",
    "",
    ""
  );
}

/*=============================================================================
 * attributeInfo()
 *
 * This function should hold all equations pertaining to the skill's behavior.
 *===========================================================================*/
protected function float attributeInfo
(
  AttributeTypes type, 
  ROTT_Combat_Hero hero, 
  int level
)
{
  local float attribute;  
  
  switch (type) {
    case PARTY_PHYSICAL_AMPLIFIER:
      attribute = level * 10;
      break;
  }
  
  return attribute;
}

/*=============================================================================
 * Default properties
 *===========================================================================*/
defaultProperties 
{
  targetingLabel=PASSIVE_DEFEND_PERK
  
  // Level lookup info
  skillIndex=WIZARD_ARCANE_SIGIL
  parentTree=CLASS_TREE

  // Skill Attributes
  skillAttributes.add((attributeSet=ON_DEFEND_PARTY_SET,mechanicType=PARTY_PHYSICAL_AMPLIFIER,tag="%amp",font=DEFAULT_SMALL_GREEN,returnType=INTEGER));
  
}





















