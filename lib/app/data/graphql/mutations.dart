final String deleteStoreEvent = r'''
 mutation DeleteEvent($id: Int){
  deleteEvent(
    filter: {
      id: $id
    }
  )
}
''';

final String loginStore = r'''
 mutation LoginStore($email: String, $password: String) {
  loginStore(
    data: {
      email: $email,
      password: $password
    } 
  ) { 
    id name email homecare category open payment 
    location neighborhood street number active firebaseToken
  }
}
''';

final String updateStoreAddress = r'''
mutation UpdateStoreAddres(
  $id: Int!, 
  $location: String, 
  $street: String, 
  $neighborhood: String, 
  $number: String) {
  updateStore(
    id: $id
    data: {
      location: $location
      street: $street
      neighborhood: $neighborhood
      number: $number
    }
  ) { id }
}
''';

final String updateStoreInfo = r'''
mutation UpdateStoreInfo($id: Int!, $homecare: Boolean, $payment: String, 
$open: String){
  updateStore(
    id: $id,
    data: {
      homecare: $homecare
      payment: $payment
      open: $open
    }
  ) { id }
}
''';

final String updateStoreStatus = r'''
mutation UpdateStatus($id: Int!) {
  updateStore(
    id: $id,
    data: {
      active: false
    }
  ) { id }
}
''';

final String updateStoreToken = r'''
mutation UpdateToken($id: Int!, $firebaseToken: String) {
  updateStore(
    id: $id,
    data: {
      firebaseToken: $firebaseToken
    }
  ) { id }
}
''';

final String createJob = r'''
 mutation CreateJob($job: String, $description: String, $price: String, $store: Int) {
  createJob(
    data: {
      job: $job,
      price: $price,
      description: $description
      store: $store
    }
  ) { id }
}
''';

final String updateJob = r'''
 mutation UpdateJob($id: Int!, $job: String, $price: String, 
 $description: String) {
  updateJob(
    id: $id,
    data: {
      job: $job
      price: $price
      description: $description
    }
  ) { id }
}
''';

final String excludeJob = r'''
mutation DeleteJob($id: Int!) {
  deleteJob(
    filter: {
      id: $id
    }
  )
}
''';
