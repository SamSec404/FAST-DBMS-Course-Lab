db = db.getSiblingDB('lab_14_task');

// Reset DB
db.dropDatabase();

// Collections
db.createCollection('developers');
db.createCollection('projects');

// ======================
// DEVELOPERS COLLECTION
// ======================

db.developers.insertMany([
{
  name: "Ali",
  country: "Pakistan",
  experience: 3,
  skills: ["JavaScript", "MongoDB", "Node.js"],
  current_project: {
    name: "Ecommerce API",
    budget: 5000,
    status: "active"
  }
},
{
  name: "Sara",
  country: "USA",
  experience: 7,
  skills: ["Python", "Django", "PostgreSQL"],
  current_project: {
    name: "Healthcare System",
    budget: 20000,
    status: "completed"
  }
},
{
  name: "John",
  country: "UK",
  experience: 5,
  skills: ["Java", "Spring", "MySQL"],
  current_project: {
    name: "Banking App",
    budget: 15000,
    status: "active"
  }
},
{
  name: "Ayesha",
  country: "Pakistan",
  experience: 2,
  skills: ["HTML", "CSS"],
  current_project: null
},
{
  name: "David",
  country: "Canada",
  experience: 10,
  skills: ["Go", "Kubernetes", "Docker"],
  current_project: {
    name: "Cloud Platform",
    budget: 30000,
    status: "active"
  }
}
]);

// ======================
// PROJECTS COLLECTION
// ======================

db.projects.insertMany([
{
  title: "Ecommerce API",
  domain: "Ecommerce",
  technologies: ["Node.js", "MongoDB"],
  budget: 5000,
  team_size: 3
},
{
  title: "Healthcare System",
  domain: "Healthcare",
  technologies: ["Python", "Django"],
  budget: 20000,
  team_size: 5
},
{
  title: "Banking App",
  domain: "Finance",
  technologies: ["Java", "Spring"],
  budget: 15000,
  team_size: 4
},
{
  title: "Cloud Platform",
  domain: "Cloud",
  technologies: ["Go", "Docker"],
  budget: 30000,
  team_size: 6
},
{
  title: "Portfolio Website",
  domain: "Personal",
  technologies: ["HTML", "CSS"],
  budget: 500,
  team_size: 1
}
]);