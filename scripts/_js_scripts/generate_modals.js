const fs = require('fs');
const path = require('path');

// Define paths
const modelsFilePath = path.join(__dirname, '../dependencies/models.txt');
const modelsDir = path.join(__dirname, '../../server/models');

// Function to format fields into schema definition
const formatField = (field) => {
  const { name, type, required, unique, defaultValue, ref } = field;
  let fieldStr = `    ${name}: { type: ${type}`;

  if (required) fieldStr += ', required: true';
  if (unique) fieldStr += ', unique: true';
  if (defaultValue) fieldStr += `, default: ${defaultValue}`;
  if (ref) fieldStr += `, ref: '${ref}'`;

  fieldStr += ' }';
  return fieldStr;
};

// Function to write Mongoose model file
const writeModelFile = (schemaName, fields) => {
  const content = `
const mongoose = require('mongoose');

const ${schemaName}Schema = new mongoose.Schema({
${fields.map(formatField).join(',\n')}
});

module.exports = mongoose.model('${schemaName}', ${schemaName}Schema);
  `.trim();

  try {
    fs.writeFileSync(path.join(modelsDir, `${schemaName}Schema.js`), content);
    console.log(`Model file for ${schemaName} created successfully. ✅`);
  } catch (err) {
    console.error(`🔴 Error writing model file for ${schemaName}:`, err);
  }
};

// Read and parse the models.txt file
try {
  const data = fs.readFileSync(modelsFilePath, 'utf8');
  const lines = data.split('\n');

  let schemaName = '';
  let fields = [];

  lines.forEach(line => {
    line = line.trim();
    if (!line) return;

    if (line.endsWith(':')) {
      if (schemaName) {
        writeModelFile(schemaName, fields);
      }
      schemaName = line.replace(':', '');
      fields = [];
    } else if (line.includes(':')) {
      const [name, typeWithOptions] = line.split(':').map(part => part.trim());
      let [type, ...options] = typeWithOptions.split(',').map(opt => opt.trim());

      const field = { name };

      if (type.startsWith('{ type:')) {
        field.type = type;
      } else {
        field.type = type;
      }

      options.forEach(option => {
        if (option === 'required') field.required = true;
        if (option === 'unique') field.unique = true;
        if (option.startsWith('default:')) field.defaultValue = option.replace('default:', '').trim();
        if (option.startsWith('ref:')) field.ref = option.replace('ref:', '').trim();
      });

      fields.push(field);
    }
  });

  // Write the last schema if any
  if (schemaName) {
    writeModelFile(schemaName, fields);
  }

  console.log('All model files have been created successfully. ✅✅');

} catch (err) {
  console.error('🔴 Error reading models file:', err);
}
