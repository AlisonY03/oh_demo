import IndexTest from './Index.test'
import ItemComponentTest from './ItemComponent.test'
import FriendModelTest from './FriendModel.test'
import abilityTest from './Ability.test';

export default function testsuite() {
  abilityTest();
  FriendModelTest()
  ItemComponentTest()
  IndexTest()
}