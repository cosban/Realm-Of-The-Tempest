/*=============================================================================
 * ROTT_Descriptor_Skill_Glyph_Dodge
 *
 * Author: Otay
 * Bramble Gate Studios (All rights reserved)
 *
 * This is a glyph skill, collected in combat to provide Dodge boost.
 *===========================================================================*/

class ROTT_Descriptor_Skill_Glyph_Dodge extends ROTT_Descriptor_Hero_Skill;
 
/*=============================================================================
 * initialize()
 *
 * this function should be called by the descriptor container to set headers
 * and paragraph formatting info
 *===========================================================================*/
public function setUI() {
  // Set header
  h1(
    "Dodge",
  );
  
  // Set header
  h2(
    "",
  );
  
  // Set paragraph information
  p1(
    "Collect this glyph during",
    "combat to increase dodge rating.",
    ""
  );
  
  // Set skill information for p2 and p3
  skillInfo(      
    "Chance to spawn: %spawn%",
    "+%dodge Dodge rating per Glyph",
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
  local float attribute; attribute = 0; 
  
  if (level == 0) return 0;
  
  switch (type) {
    case GLYPH_SPAWN_CHANCE:
      attribute = 25;
      break;
    case GLYPH_DODGE_BOOST:
      attribute = -10 + 35 * level + (level / 2) * 5 + (level / 4) * 5;
      break;
  }
  
  return attribute;
}

/*============================================================================= 
 * Default Properties
 *===========================================================================*/
defaultProperties 
{
  // Level lookup info
  skillIndex=GLYPH_TREE_DODGE
  parentTree=GLYPH_TREE

  // Glyph Attributes
  skillAttributes.add((attributeSet=GLYPH_SET,mechanicType=GLYPH_SPAWN_CHANCE,tag="%spawn",font=DEFAULT_SMALL_BLUE,returnType=INTEGER));
  skillAttributes.add((attributeSet=GLYPH_SET,mechanicType=GLYPH_DODGE_BOOST,tag="%dodge",font=DEFAULT_SMALL_GREEN,returnType=INTEGER));
  
}

/**

function int GetDodge(string StatType, int SkillLevel)
{
  local int i, j, iDodge, iChance;
  //(Rand(Max - Min) + Min)
  
  i = 0;
  j = 2;
  iDodge = 4;
  iChance = 40;
  do
  {
    iDodge = iDodge + 2 + j;
    
    if (i%2 == 0 && i != 0)
    {
      j = j + 6;
    } else {
      j = j + 4;
    }
    
    i++;
  } until (i >= SkillLevel);
  
  // Return type 
  switch (StatType)
  {
    case "Stat":
      return iDodge;
    case "Chance":
      return iChance;
  }
}

**/


















