#!/usr/bin/env python3

import logging
import time
import sys
import os

# Konfiguration des Loggings
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.StreamHandler(sys.stdout)
    ]
)

logger = logging.getLogger('msgrelay')

def main():
    logger.info("Starte Message Relay Service")
    
    try:
        # Hier würde die eigentliche Nachrichtenweiterleitung implementiert
        while True:
            logger.info("Message Relay Service läuft...")
            time.sleep(60)
    except KeyboardInterrupt:
        logger.info("Service wird beendet")
    except Exception as e:
        logger.error(f"Fehler im Service: {e}")
        raise

if __name__ == "__main__":
    main() 