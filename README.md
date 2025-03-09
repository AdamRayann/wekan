### [🚀 Automated Testing & Feature Implementation for Wekan (Java, Docker, RabbitMQ, CI/CD) (Jan 2025 – Feb 2025)](https://www.canva.com/design/DAGgZ2Qkylc/_nHOjuIGLun6J_FbEnk-4Q/view?utm_content=DAGgZ2Qkylc&utm_campaign=designshare&utm_medium=link2&utm_source=uniquelinks&utlId=h2f642b72dd)

- [**Developed and integrated a new feature**](https://github.com/AdamRayann/AICardsSorter.git) into the Wekan open-source task management platform, interacting with a **third-party AI model (Llama AI)** for automated task sorting.
- **Designed and implemented a microservices-based architecture** in **Docker Compose**, ensuring scalability and modularity.
- **Integrated message-based communication** using **RabbitMQ** for **asynchronous processing** of card creation and deletion.
- **Handled API requests efficiently** within the microservice architecture, ensuring seamless AI model interaction and optimized response times.

---

### 🛠️ **Testing Across All Development Stages**

#### **✅ Unit Testing & Code Quality**
- Developed **JUnit-based unit tests** to validate core logic.
- Applied **Checkstyle** to enforce coding standards and maintainability.

#### **✅ Integration Testing**
- **API testing** using **REST Assured** to verify endpoint functionality.
- **UI testing** via **Selenium Grid** for cross-browser and multi-device validation.  
- **[GitHub Repository: Wekan Integration Tests](https://github.com/AdamRayann/WekanTesting.git)**  

#### **✅ Load & Performance Testing**
- Conducted **stress tests and performance benchmarking** to optimize response times.
- Utilized **Lighthouse for performance audits**, ensuring smooth user experience.

#### **✅ Security & Vulnerability Testing**
- Performed **security scans** on dependencies and Docker images.
- Ensured compliance with **security best practices** via **Trivy and OWASP ZAP**.

---

### ⚙️ **CI/CD & Deployment Automation**
- **Built and automated CI/CD pipelines** using **GitHub Actions**, enabling:
  - **Build environment**: Automated **containerization** and **static analysis**.
  - **Integration environment**: Triggered **end-to-end tests** before merging code.
  - **Preproduction environment**: Executed **performance, security, and load tests** on a production-like setup.
