// Uncomment the following if you're using cloud functions
// import { getFunctions, httpsCallable } from 'firebase/functions';
import { FirebaseApp, initializeApp } from 'firebase/app';
import { getFirestore } from 'firebase/firestore';
import { getAuth } from 'firebase/auth';
import firebaseConfig from './firebaseConfig';

function initializeFirebase() {
  const app = initializeApp(firebaseConfig);

  return app;
}

function initializeCloudFunctions() {
  // Uncomment the following if you're using cloud functions
  // const functions = getFunctions();
  // const myCloudFunction = httpsCallable(functions, 'myCloudFunction');

  return {
    // myCloudFunction,
  };
}

function initializeAuthServices() {
  const authRef = getAuth();

  return {
    authRef,
  };
}

function initializeFirestoreServices(app: FirebaseApp) {
  const firestoreRef = getFirestore(app);
  return {
    firestoreRef,
  };
}

export type FirebaseServices = ReturnType<typeof getFirebaseServices>;
function getFirebaseServices() {
  const app = initializeFirebase();
  const cloudFunctions = initializeCloudFunctions();
  const authServices = initializeAuthServices();
  const firestoreServices = initializeFirestoreServices(app);
  return { ...cloudFunctions, ...authServices, ...firestoreServices };
}

export default getFirebaseServices;
