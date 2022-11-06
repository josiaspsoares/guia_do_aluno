// The Cloud Functions for Firebase SDK to create Cloud Functions and set up triggers.
const functions = require('firebase-functions');

// The Firebase Admin SDK to access Firestore.
const admin = require('firebase-admin');
admin.initializeApp();

// Send Push Notification on Update Notice
exports.sendPushNotificationOnUpdateNotice = functions
    .firestore.document('notices/{noticeId}').onUpdate(async (snap, context) => {
        const newValue = snap.after.data();

        const title = newValue.title;
        const description = newValue.description;
        const userID = newValue.userID;

        const userAvatar = await admin.firestore().collection('users').doc(userID).get().then((doc) => {
            return doc.data().avatarUrl;
        });

        const payload = {
            notification: {
                title: title,
                body: description,
                image: userAvatar,
                sound: 'default'
            }
        };

        return admin.messaging().sendToTopic('auth', payload);
    });

// Send Push Notification on Create Courseware
exports.sendPushNotificationOnCreateCourseware = functions
    .firestore.document('courseware/{coursewareId}').onCreate(async (snap, context) => {
        const newValue = snap.data();

        const title = newValue.title;
        const description = newValue.description;
        const subjectId = newValue.subjectID;

        const subjectName = await admin.firestore().collection('subjects').doc(subjectId).get().then((doc) => {
            return doc.data().name;
        });

        const payload = {
            notification: {
                title: 'Novo material de ' + subjectName,
                body: title + ' - ' + description,
                sound: 'default'
            }
        };

        return admin.messaging().sendToTopic('auth', payload);
    });


// Send Notification Mo, Tu, We,Th at 06:00 pm
exports.sendPushNotificationOnMoTuWeTh = functions.pubsub.schedule('00 18 * * 1,2,3,4').timeZone('America/Sao_Paulo').onRun((context) => {
    const payload = {
        notification: {
            title: 'Lembrete de Aulas',
            body: '✅ Segunda-feira (Redes e Banco de Dados)\n✅ Terça-feira (Projeto Integrador e Redes)\n✅ Quarta-feira (Matemática Computacional)\n✅ Quinta-feira (Eng. de Software e Matemática Computacional)',
            sound: 'default'
        }
    };

    return admin.messaging().sendToTopic('auth', payload);
});