<?php
/**
 * YelpApi module for Craft CMS 3.x
 *
 * fetch data from YelpApi
 *
 * @link      bryan.test
 * @copyright Copyright (c) 2021 bry
 */

namespace modules\yelpapimodule;

use modules\yelpapimodule\assetbundles\yelpapimodule\YelpApiModuleAsset;

use Craft;
use craft\events\RegisterTemplateRootsEvent;
use craft\events\TemplateEvent;
use craft\i18n\PhpMessageSource;
use craft\web\View;

use yii\base\Event;
use yii\base\InvalidConfigException;
use yii\base\Module;

class YelpApiModule extends Module
{
  
    public static $instance;

    public function __construct($id, $parent = null, array $config = [])
    {
        Craft::setAlias('@modules/yelpapimodule', $this->getBasePath());
        $this->controllerNamespace = 'modules\yelpapimodule\controllers';

        $i18n = Craft::$app->getI18n();
        if (!isset($i18n->translations[$id]) && !isset($i18n->translations[$id.'*'])) {
            $i18n->translations[$id] = [
                'class' => PhpMessageSource::class,
                'sourceLanguage' => 'en-US',
                'basePath' => '@modules/yelpapimodule/translations',
                'forceTranslation' => true,
                'allowOverrides' => true,
            ];
        }

        Event::on(View::class, View::EVENT_REGISTER_CP_TEMPLATE_ROOTS, function (RegisterTemplateRootsEvent $e) {
            if (is_dir($baseDir = $this->getBasePath().DIRECTORY_SEPARATOR.'templates')) {
                $e->roots[$this->id] = $baseDir;
            }
        });

        static::setInstance($this);

        parent::__construct($id, $parent, $config);
    }

    public function init()
    {
        parent::init();
        self::$instance = $this;

        if (Craft::$app->getRequest()->getIsCpRequest()) {
            Event::on(
                View::class,
                View::EVENT_BEFORE_RENDER_TEMPLATE,
                function (TemplateEvent $event) {
                    try {
                        Craft::$app->getView()->registerAssetBundle(YelpApiModuleAsset::class);
                    } catch (InvalidConfigException $e) {
                        Craft::error(
                            'Error registering AssetBundle - '.$e->getMessage(),
                            __METHOD__
                        );
                    }
                }
            );
        }

        Craft::info(
            Craft::t(
                'yelp-api-module',
                '{name} module loaded',
                ['name' => 'YelpApi']
            ),
            __METHOD__
        );
    }

}
