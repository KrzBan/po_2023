import { Button, StyleSheet, Text, View } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import Server from './Server'

function HomeScreen({ navigation }) {
  return (
    <View style={styles.container}>
      <Text>Home Screen</Text>
      <Button
        title="Go to Shop"
        onPress={() => navigation.navigate('Shop')}
      />
    </View>
  );
}

function CategoryButton({category, navigation}) {
  return (
    <Button
        title={category}
        onPress={() => navigation.navigate('Category', {
          category: category
        })}
      />
  )
}

function ShopScreen({navigation}) {
  return (
    <View style={styles.container}>
      <Text>Shop Screen</Text>
      <Text>Categories:</Text>
      <CategoryButton navigation={navigation} category={"Electronics"} />
      <CategoryButton navigation={navigation} category={"Furniture"} />
      <CategoryButton navigation={navigation} category={"Cars"} />
    </View>
  );
}

function CategoryScreen({route}) {
  const {category } = route.params;

  const items = Server.FetchItems(category);

  return (
    <View style={styles.container}>
      <Text>{category}</Text>
      
      {items.map(item => (
        <div key={item.id}>
          <Text>{item.name}</Text>
          <Text>{item.price} zł</Text>
        </div>
      ))}

    </View>
  )
}

const Stack = createNativeStackNavigator();

function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Home">
        <Stack.Screen name="Home" component={HomeScreen} />
        <Stack.Screen name="Shop" component={ShopScreen} />
        <Stack.Screen name="Category" component={CategoryScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});

export default App;