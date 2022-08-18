final String getJobId = r'''
  query GetJobs($id: Int) {
  job(
    filter: { id: $id }
    ) { job description price }
}
''';

final String getJobsByStore = r'''
 query GetJobsByStore($store: Int!) {
  jobsByStore(
    filter: {
      store: $store
    }
  ) { id job description price }
}
''';

final String getPublications = r'''
 query {
  publications {
    id title text image
  }
}
''';

final String getPublication = r'''
  query GetPublication($id: Int) {
  publication(
    filter: { id: $id }
  ) { title text image}
}
''';

final String getStoreEvents = r'''
query GetStoreEvents($store: Int) {
  events(
    filter: {
      store: $store
    }
  ) { id date hour { hour }
  		user { name email location street neighborhood number firebaseToken }
    	job { job price }
  }
}
''';
