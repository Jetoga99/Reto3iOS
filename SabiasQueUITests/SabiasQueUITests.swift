//
//  SabiasQueUITests.swift
//  SabiasQueUITests
//
//  UI Tests de la app "¿Sabías qué?". Recorren el flujo completo
//  (categorías -> dato curioso -> otro dato) y adjuntan una captura
//  de pantalla en cada paso para que el workflow de GitHub Actions
//  las suba como artifact.
//

import XCTest

final class SabiasQueUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    /// Adjunta una captura de pantalla con lifetime .keepAlways para que
    /// xcparse pueda extraerla del .xcresult sin importar si el test
    /// pasó o falló.
    private func attachScreenshot(name: String) {
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
    }

    func testFlujoCompletoDeLaApp() throws {
        let app = XCUIApplication()
        app.launch()

        // 1. Pantalla de selección de categoría.
        let cienciaButton = app.buttons["Ciencia"]
        XCTAssertTrue(cienciaButton.waitForExistence(timeout: 5), "No se encontró el botón de la categoría Ciencia")
        attachScreenshot(name: "01-pantalla-categorias")

        // 2. Se selecciona la categoría "Ciencia" y se valida la navegación.
        cienciaButton.tap()

        let navigationTitle = app.navigationBars["Ciencia"]
        XCTAssertTrue(navigationTitle.waitForExistence(timeout: 5), "No navegó a la pantalla de la categoría Ciencia")

        let nextFactButton = app.buttons["Muéstrame otro dato"]
        XCTAssertTrue(nextFactButton.waitForExistence(timeout: 5), "No se encontró el botón para mostrar otro dato")
        attachScreenshot(name: "02-pantalla-dato-curioso")

        // 3. Se toca el botón de nuevo y se valida que la app siga respondiendo.
        nextFactButton.tap()
        XCTAssertTrue(nextFactButton.exists, "El botón debería seguir visible tras mostrar otro dato")
        attachScreenshot(name: "03-otro-dato-curioso")
    }
}
