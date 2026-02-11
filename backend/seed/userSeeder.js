// const { createUser } = require('../models/userModel');

// (async () => {
//   try {
//     await createUser('admin', 'admin123');  // username: admin, password: admin123
//     console.log('Dummy admin user created!');
//     process.exit();
//   } catch (err) {
//     console.error(err);
//     process.exit(1);
//   }
// })();


const { createUser } = require('../models/userModel');

(async () => {
  try {
    await createUser('yaya', 'bitsyaya');  // username: yaya, password: bitsyaya
    console.log('Dummy yaya user created!');
    process.exit();
  } catch (err) {
    console.error(err);
    process.exit(1);
  }
})();
